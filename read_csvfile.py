import pandas as pd

# Read the CSV file
df = pd.read_csv('exportSecurityGroupsToCsv.csv')

# Function to generate .tfvars content from DataFrame
def generate_tfvars(df, output_file):
    with open(output_file, 'w') as f:
        for _, row in df.iterrows():
            f.write(f'group_name_{row["id"]} = "{row["group_name"]}"\n')
            f.write(f'description_{row["id"]} = "{row["description"]}"\n')

# Generate the .tfvars file
generate_tfvars(df, 'security_groups.tfvars')