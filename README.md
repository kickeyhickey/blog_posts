# README

* button creation - with bulma css (this allows for func and for the confirmation window to appear)
    - when creating the delete button with Rails 7
      - don't use link_to, instead use button_to
    -  use: 
       -  form: { data: { turbo_confirm: "are you sure?" } }, instead of, data: { confirm: "are you sure?" } 