# BMTC Database Administration and Migration to Azure Data Factory

## Project Overview

This repository contains the source code and documentation for the **Building Materials Trading Company (BMTC)** database administration and migration to **Azure Data Factory (ADF)** project. The goal of this project is to transition BMTC's on-premises data management systems to Azure cloud services, leveraging ADF to ensure a smooth, scalable, and efficient migration.

## Project Structure

```plaintext
/
├── docs/                  # Click the Wiki button above to find project documentation
|   ├── charter.md         # Outline of objectives, scope, stakeholders, key deliverables
│   ├── mig_plan.md        # Detailed migration plan
│   ├── database_iar.md    # Inventory & Assessment report documenting existing database systems
│   ├── architecture.md    # Overview of architecture and design
│   ├── mig_strat.md       # Detailed technical approach and methodology
│   ├── risk_mgmt.md       # Identify potential risks to the migration project and outline strategies to mitigate them
│   ├── proj_schedule.md   # Visualize and track the timeline and milestones of the project
│   ├── status.md          # regular updates on the project's progress, risks, issues, and next steps
│   ├── qa.md              # Test plan and quality assurance strategy
│   ├── post-mig_report.md # document completion, lessons learned, final checks
│   ├── change_mgmt.md     # prepare the organization for new cloud-based system and manage user adoption
│   ├── brm.md             # Budget and resource management
│   └── readme.md          # Project-specific README for documentation
├── scripts/               # SQL, ADF pipeline scripts, and migration scripts
│   ├── create_tables/     # SQL scripts for table creation
│   ├── stored_procs/      # Stored procedure scripts
│   └── azure_pipelines/   # ADF pipeline definitions
├── resources/             # Resources related to the migration process
│   ├── diagrams/          # Database and migration flow diagrams
│   └── configs/           # Configuration files
└── README.md              # Project overview and instructions (this file)
```
[See Wiki for project documentation.](https://github.com/vespertron/BuildingMaterialsTradingCo/wiki/Hey-There!)

## Objectives

- **Database Administration:** Manage the existing on-premises databases, ensuring their optimal performance, security, and availability.
- **Migration:** Migrate on-premises data to Azure using Azure Data Factory, ensuring data integrity, security, and minimal downtime.
- **Automation:** Automate the database administration tasks and migration process to improve efficiency and reduce human errors.
- **Predictive Maintenance:** Integrate AI/ML models into database environments to enhance capabilities such as predictive maintenance, anomaly detection in data, and automation of routine tasks.
- **Scalability & Performance:** Utilize Azure’s cloud solutions to scale the database infrastructure and optimize performance.

## Technologies Used

- **Azure Data Factory (ADF):** A cloud-based ETL (Extract, Transform, Load) service to automate the data migration.
- **SQL Server:** For managing the on-premises databases.
- **Azure SQL Database:** Target destination for migrated databases in the cloud.
- **Azure Storage (Blob, Data Lake):** Used for storing intermediary data and backups.
- **PowerShell & Azure CLI:** For automation of tasks like database backup, migration, and monitoring.

## Setup Instructions

### Prerequisites

Before running this project, ensure you have the following tools and accounts set up:

1. **Azure Account** – Create an account if you don't have one: [Azure Signup](https://azure.microsoft.com/en-us/free/)
2. **Azure Data Factory Instance** – Create an instance in the Azure portal.
3. **SQL Server Management Studio (SSMS)** – For managing the on-premises SQL Server.
4. **Azure CLI** – For Azure resource management.
5. **PowerShell** – For script automation.

### Cloning the Repository

Clone this repository to your local machine using:

```bash
git clone https://github.com/your-username/BMTC-database-migration.git
```

### Configuration

- Set up **Azure Data Factory** pipelines and linked services as specified in the `azure_pipelines/` directory.
- Configure any required **SQL Server** connection strings and **Azure credentials** within the `configs/` folder.
- Modify `migration_plan.md` for the customized migration approach that aligns with your project timeline and dependencies.

### Running the Migration Scripts


#### 1. Pre-Migration Tasks:
- Backup all on-premises databases.
- Ensure that any necessary security and compliance checks are in place.

#### 2. Execution:
- Run the ADF pipelines by following the instructions in the `azure_pipelines/` directory.
- Monitor the migration progress through the Azure portal and ensure that all data is transferred successfully.

#### 3. Post-Migration Tasks:
- Verify data consistency and integrity.
- Test any custom stored procedures and business logic.

### Azure Data Factory Pipeline Setup

- **Source Dataset:** The source dataset configuration for on-prem SQL Server.
- **Sink Dataset:** The destination for the data in Azure SQL Database or Azure Storage.
- **Transformations:** Any necessary transformations (e.g., SQL scripts, data validation).

## Documentation
- Architecture Overview
- Detailed Migration Plan
- Project-specific README

## Contributing
We welcome contributions to improve the project. If you'd like to contribute, please:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add a new feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new pull request.

## License
This project is licensed under the MIT License – see the LICENSE.md file for details.

## Acknowledgements
- Thanks to the Azure team for providing robust cloud services.
- Thanks to FCTG for the interesting business case.
