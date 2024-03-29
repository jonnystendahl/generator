CREATE TABLE {{ table.dataset }}.{{ table.name }} (
    {% for column in table.columns %}
    {{ column.name }} {{ column.type }}{% if column.description %} OPTION(description='{{ column.description }}'){% endif %}{% if not loop.last %},
    {% endif %}
    {% endfor %}
    {% if table.partition_column +%}
    PARTITION BY {{ table.partition_column }}
    {% endif %}
)
{% if table.cluster_columns %}
CLUSTER BY {% for column in table.cluster_columns %}{{ column }}{% if not loop.last %}, {% endif %}{% endfor %}
{% endif +%}
;
