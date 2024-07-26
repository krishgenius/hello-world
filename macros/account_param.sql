{% macro isdeleted (del_flg) %}
decode(del_flg,'Y','DELETED-local code','ACTIVE')
{% endmacro %}

{% macro conversion_required (CURRENCYISOCODE) %}
decode(currencyisocode,'USD','NOT REQUIRED','CURRENCY CONVERSION REQUIRED')
{% endmacro %}
