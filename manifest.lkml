### Looker Manifest
### Author: 

project_name: "looker-template"

####################################################################################
###                                  CONSTANTS                                   ###
####################################################################################

# Makes Negative Values Red
constant: make_negative_red {
  value: "<a href=#drillmenu target=_self>
  {% if value < 0 %} <p style='color: red; font-size: 100%'>
  {{ rendered_value }} </p>
  {% else %}<p style='font-size:100%'>
  {{ rendered_value }} </p>
  {% endif %}</a>"
}

# URL Links
constant: url_link {
  value: "<div style='color:blue;font-size:100%'>{{ rendered_value }}&nbsp;<span>&#128279;</span></div>"
}