import pandas as pd

# Read the CSV file
df = pd.read_csv('exportSecurityGroupsToCsv.csv')

# Function to generate .tfvars content from DataFrame
def generate_tfvars(df, output_file):
    with open(output_file, 'w') as f:
        for _, row in df.iterrows():
            # print (f'row-->>> {row}')
            # id, grp_name, descrp, grp_id
            f.write(f'GroupId_{row["id"]} = "{row["GroupId"]}"\n')
            f.write(f'Description_{row["id"]} = "{row["Description"]}"\n')

# Generate the .tfvars file
generate_tfvars(df, 'security_groups.tfvars')