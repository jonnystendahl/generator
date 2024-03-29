import os
import yaml
from jinja2 import Environment, FileSystemLoader

def load_yaml(file_path):
    with open(file_path, 'r') as file:
        data = yaml.safe_load(file)
    return data

def generate_create_table_sql(tables):
    env = Environment(loader=FileSystemLoader('./templates'), trim_blocks=True, lstrip_blocks=True)
    template = env.get_template('create_table.sql')

    for table in tables:
        print(template.render(table=table))
        print('---------')

if __name__ == "__main__":
    tables_yaml_path = "./metadata/tables.yaml"

    tables_data = load_yaml(tables_yaml_path)
    generate_create_table_sql(tables_data['tables'])