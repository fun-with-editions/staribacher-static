var editor = new LoadEditor({
  aot: {
    title: "Text Annotations",
    variants: [
      {
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
      /*{
        opt: "del",
        opt_slider: "deleted-slider",
        title: "Streichung",
        color: "black",
        html_class: "del",
        hide: {
            hidden: true,
            class: "del"
        },
        css_class: "strikethrough",
        features: {
            all: false,
            class: "features-2"
        }
    }, */ {
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
      // opt_slider: "add-slider"
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
    },
  },
  ff: {
    name: "Change font family",
    variants:  [
        {
            // must match opt attribute of custom element
            opt: "select-font",
            // visible feature title
            title: "Font family",
            // default url parameter key
            urlparam: "font",
            // default citation url link
            chg_citation: "citation-url",
            // default fonts
            fonts: {
                default: "Courier-New",
                font1: "Times-New-Roman",
                font2: "Courier-New",
                font3: "Arial-serif"
            },
            // default tag-name for text
            paragraph: "p",
            // default class of paragaph tag
            p_class: "yes-index",
            // not required but can be used to create addition styles
            css_class: ""
        }
      ],
      // class for active state
      active_class: "active",
      // default class for select dropdown
      // stylesheet provided by bootstrap
      html_class: "custom-select"
  },
  fos: {
    name: "Change font size",
    variants:  [
        {
            // must match opt attribute value of custom element
            opt: "[opt]",
            // visible feature title
            title: "Schriftgröße",
            // url parameter name
            urlparam: "fontsize",
            // custom class for citation link
            chg_citation: "citation-url",
            // default font sizes
            sizes: {
                default: "default",
                font_size_14: "14",
                font_size_18: "18",
                font_size_22: "22",
                font_size_26: "26"
            },
            // default tag-name containing text
            paragraph: "p",
            // default class in combination with paragraph that contains text
            p_class: "yes-index",
            // default addition to css class. Will be combined with font size value
            css_class: "font-size-"
        }
    ],
    // default class for state
    active_class: "active",
    // default class for select dropdown
    // stylesheet provided by bootstrap
    html_class: "custom-select"
},
up: true,
})
