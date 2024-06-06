#!/usr/bin/env python3
import csv
import glob
import os
import json
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm

file_list = sorted(glob.glob("./data/editions/*.xml"))
data_dir = os.path.join("html", "js-data")
os.makedirs(data_dir, exist_ok=True)
out_file = os.path.join(data_dir, "calendarData.js")

no_dates = []
data = []
broken = []
for file_name in file_list: # tqdm(file_list, total=len(file_list)):
    print(f"«{filename}»")
    doc = TeiReader(file_name)
    head, tail = os.path.split(file_name)
    id = tail.replace(".xml", "")

    # correspAction/date
    try:
        sent_date_node = doc.any_xpath("//tei:creation/tei:date")[0]
    except IndexError:
        broken.append(f"missing '//tei:creation/tei:date' in file: {file_name}")
        continue
    is_valid_date = False
    if "when-iso" in sent_date_node.attrib:
        ca_date_when = sent_date_node.attrib["when-iso"]
        is_valid_date = True
    elif "when" in sent_date_node.attrib:
        ca_date_when = sent_date_node.attrib["when"]
        is_valid_date = True
    elif "from" in sent_date_node.attrib:
        ca_date_when = sent_date_node.attrib["from"]
        is_valid_date = True
    elif "to" in sent_date_node.attrib:
        ca_date_when = sent_date_node.attrib["to"]
        is_valid_date = True
    else:
        no_dates.append(tail)


    print('ich bin here')

    if is_valid_date:
        item = {
            "id": id + ".html",
            "name": doc.any_xpath("//tei:title[@type='main']/text()")[0],
            "date": ca_date_when,
        }
        data.append(item)
    print(f'ende {file_name}')


print(f"{len(data)} Datumsangaben aus {len(file_list)} Dateien extrahiert")

print(f"writing calendar data to {out_file}")
with open(out_file, "w", encoding="utf8") as f:
    my_js_variable = f"var calendarData = {json.dumps(data, ensure_ascii=False)}"
    f.write(my_js_variable)

no_dates_file = "./html/no_dates.csv"
print(f"writing files without date to {no_dates_file}")

with open(no_dates_file, "w", newline="") as csvfile:
    my_writer = csv.writer(csvfile, delimiter=",")
    my_writer.writerow(["file_name"])
    for fail_name in no_dates:
        my_writer.writerow([fail_name])
for x in broken:
    print(x)
