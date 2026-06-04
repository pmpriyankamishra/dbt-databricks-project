{% set apples = ["Red Delicious","red","Granny Smith","Golden Delicious","yellow"] %}

{%- for apple in apples -%}
    {% if apple != "Red Delicious" %}
        {{ apple }}
    {% endif %}
{%- endfor -%}