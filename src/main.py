import os
import yaml
from jinja2 import Environment, FileSystemLoader

# Create then jinja environment as a global variable
env = Environment(loader=FileSystemLoader('./templates'), trim_blocks=True, lstrip_blocks=True)

def write_statement_to_files(folder, subfolder, filename, content):
    # Create directory if it doesn't exist
    directory = os.path.join(folder, subfolder)
    os.makedirs(directory, exist_ok=True)

    # Write table to file
    filepath = os.path.join(directory, filename)
    with open(filepath, 'w') as f:
        f.write(content)
            
def load_yaml(file_path):
    with open(file_path, 'r') as file:
        data = yaml.safe_load(file)
    return data

def generate_create_table_sql(tables):
    template = env.get_template('create_table.jinja2')
    
    for table in tables:
        folder = table['folder']
        subfolder = table['subfolder']
        filename = "create_{}.sql".format(table['name'])
        create_table_ddl = template.render(table=table)
        write_statement_to_files(folder, subfolder, filename, create_table_ddl)

if __name__ == "__main__":
    tables_yaml_path = "./metadata/tables.yaml"

    tables_data = load_yaml(tables_yaml_path)
    generate_create_table_sql(tables_data['tables'])