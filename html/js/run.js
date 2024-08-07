var editor = new LoadEditor({
    aot: {
      title: "Text Annotations",
      variants: [{
          opt: "entities-features",
          opt_slider: "entities-features-slider",
          title: "Alle Inhalte",
          color: "grey",
          html_class: "undefined",
          css_class: "undefined",
          chg_citation: "citation-url",
          hide: {
            hidden: false,
            class: "undefined",
          },
          features: {
            all: true,
            class: "features-1",
          },
        },
        {
          opt: "prs",
          color: "blue",
          title: "Personen",
          html_class: "person",
          css_class: "pers",
          hide: {
            hidden: false,
            class: "person .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
        {
          opt: "add",
          opt_slider: "addition-slider",
          title: "Hinzufügungen",
          color: "green",
          html_class: "add",
          hide: {
            hidden: true,
            class: "add"
          },
          css_class: "add-zeichen",
          features: {
            all: false,
            class: "features-1"
          }
        },
        {
          opt: "crt",
          title: "Korrektionen",
          color: "red",
          html_class: "cor",
          hide: {
            hidden: true,
            class: "cor",
          },
          css_class: "cor-zeichen",
          features: {
            all: false,
            class: "features-1",
          },
        },
      ],
      span_element: {
        css_class: "badge-item",
      },
      active_class: "activated",
      rendered_element: {
        label_class: "switch",
        slider_class: "i-slider round",
      }
    },
    ff: {
      name: "Change font family",
      variants: [{
          opt: "ff",
          title: "Schriftart",
          urlparam: "ff",
          chg_citation: "citation-url",
          fonts: {
            default: "Standardschriftart",
            font1: "Times-New-Roman",
            font2: "Courier-New",
            font3: "Arial-serif"
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: ""
        }
      ]
    },
    fos: {
      name: "Change font size",
      variants: [{
          opt: "fs",
          title: "Schriftgroße",
          urlparam: "fs",
          chg_citation: "citation-url",
          sizes: {
            default: "standard",
            font_size_14: "14",
            font_size_18: "18",
            font_size_22: "22",
            font_size_26: "26"
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: "font-size-"
        }
      ]
    }
  }
)