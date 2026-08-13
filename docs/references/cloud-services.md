---
icon: lucide/cloud
title: Cross-cloud service comparison matrix
description: "A quick-reference guide mapping generic cloud technology paradigms across Microsoft Azure, Amazon Web Services, Google Cloud Platform, and Alibaba Cloud."
revision_date: 2026-08-14
---

# Cross-cloud service comparison matrix

> *A quick-reference guide mapping generic cloud technology paradigms across Microsoft Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and Alibaba Cloud*

---

When drafting documentation for multi-cloud environments, site reliability engineering (SRE) runbooks, or cross-platform migrations, technical writers must frequently translate platform-specific product names into generic concepts or competitor equivalents. 

Use this reference guide to quickly map generic cloud paradigms across Microsoft Azure, AWS, GCP, and Alibaba Cloud.

---

## Infrastructure as a service (IaaS)

Infrastructure as a service (IaaS) is a cloud computing model providing on-demand access to virtualized servers, storage, and networking over the internet.

### Compute services

Compute services provide the processing power, virtual machines, and container options needed to run cloud workloads.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Virtual machines (VMs)** | Azure Virtual Machines | Amazon EC2 | Compute Engine | Elastic Compute Service (ECS) |
| **Container services** | Azure Container Instances, Azure Kubernetes Service | Amazon ECS, Amazon EKS, AWS Fargate | Google Kubernetes Engine (GKE), Cloud Run | Container Service for Kubernetes (ACK), Elastic Container Instance |
| **Bare-metal servers** | Azure Stack HCI, Azure Dedicated Host, Azure Bare Metal Instances | Amazon EC2 Dedicated Hosts, Amazon EC2 Bare Metal Instances | Bare Metal Solution, Sole-Tenant Nodes | ECS Bare Metal Instance |
| **Graphics processing unit (GPU) instances** | Azure Virtual Machines (NC, ND, NV series) | Amazon EC2 GPU Instances | Compute Engine GPUs | Elastic GPU Service (EGS) |
| **Auto scaling** | Virtual Machine Scale Sets | AWS Auto Scaling, Amazon EC2 Auto Scaling | Managed Instance Groups (MIG) autoscaling | Auto Scaling |
| **Serverless computing** | Azure Functions | AWS Lambda | Cloud Functions, Cloud Run | Function Compute |

### Storage services

Storage services offer scalable options for block, object, and file storage, as well as data lakes for analytics.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Block storage** | Azure Disk Storage, Azure Files, Azure Managed Disks | Amazon EBS | Persistent Disk | Elastic Block Storage (EBS) |
| **Object storage** | Azure Blob Storage | Amazon S3 | Cloud Storage | Object Storage Service (OSS) |
| **File storage** | Azure File Storage, Azure NetApp Files | Amazon EFS, Amazon FSx | Filestore | Network Attached Storage (NAS) |
| **Archive storage** | Azure Archive Storage | Amazon S3 Glacier | Cloud Storage (Archive storage class) | Archive Storage |
| **Data lakes** | Azure Data Lake | AWS Lake Formation, Amazon S3 | Dataplex, Cloud Storage | Alibaba Data Lake |

### Networking services

Networking services connect your cloud resources securely through virtual networks, load balancers, and content delivery networks (CDNs).

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Virtual networks: Virtual local area networks (VLANs), virtual private networks (VPNs)** | Azure Virtual Network (VNet) | Amazon VPC, AWS Client VPN | Virtual Private Cloud (VPC), Cloud VPN | Virtual Private Cloud (VPC) |
| **Virtual private cloud** | Virtual Network (VNet) | Amazon VPC | Virtual Private Cloud (VPC) | Virtual Private Cloud (VPC) |
| **Load balancing** | Azure Load Balancer, Application Gateway/Network Load Balancer | Elastic Load Balancing (ELB) | Cloud Load Balancing | Server Load Balancer (SLB) |
| **Content delivery networks** | Azure Content Delivery Network | Amazon CloudFront | Cloud Content Delivery Network | Alibaba Cloud Content Delivery Network |
| **Direct connect** | ExpressRoute | AWS Direct Connect | Cloud Interconnect | Express Connect |

---

## Platform as a service (PaaS)

Platform as a service (PaaS) provides a cloud-based environment for developers to build, manage, and deliver applications.

### Development and deployment

Development and deployment tools help developers create, test, build, and deploy applications across various cloud platforms.

| Generic technology | Microsoft Azure | Amazon Web Services (AWS) | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Integrated development environments (IDEs)** | Visual Studio, Visual Studio Code, Visual Studio for Mac | AWS Cloud9 | Cloud Workstations, Cloud Shell Editor | - |
| **Continuous integration and continuous delivery (CI/CD) pipelines** | Azure DevOps, Azure Pipelines | AWS CodePipeline, AWS CodeBuild, AWS CodeDeploy | Cloud Build, Cloud Deploy | - |
| **Application servers** | Tomcat, Internet Information Services (IIS), Azure App Service | AWS Elastic Beanstalk | App Engine | - |
| **Container instances** | Azure Container Instances | AWS Fargate | Cloud Run | Elastic Container Instance |
| **Kubernetes service** | Azure Kubernetes Service (AKS) | Amazon Elastic Kubernetes Service (EKS) | Google Kubernetes Engine (GKE) | Container Service for Kubernetes (ACK) |

### Data services

Data services provide scalable, managed storage and database options, including relational, NoSQL, and in-memory databases.

| Generic technology | Microsoft Azure | Amazon Web Services (AWS) | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Relational databases** | Azure SQL Database, Azure PostgreSQL | Amazon Relational Database Service (RDS), Amazon Aurora | Cloud SQL, Cloud Spanner | ApsaraDB for RDS |
| **NoSQL databases** | Azure Cosmos DB | Amazon DynamoDB | Firestore, Cloud Bigtable | Table Store |
| **In-memory databases** | Azure Redis | Amazon ElastiCache | Memorystore (for Redis/Memcached) | ApsaraDB for Redis |
| **MongoDB application programming interface (API)** | Azure Cosmos DB (MongoDB API) | Amazon DocumentDB | MongoDB Atlas on Google Cloud (partner) | ApsaraDB for MongoDB |
| **Data warehousing** | Azure Synapse Analytics, Power BI | Amazon Redshift | BigQuery | MaxCompute |
| **Data processing services** | Azure Synapse Analytics | Amazon Elastic MapReduce (EMR), AWS Glue | Dataflow, Dataproc | MaxCompute |

---

## Software as a service

Software as a service (SaaS) is a cloud-based software delivery model where applications are hosted by a provider and accessed over the internet.

### Productivity and collaboration

Productivity and collaboration tools enable teams to create, share, and work together on documents, emails, calendars, and projects.

| Generic technology | Microsoft Azure | Amazon Web Services (AWS) | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Office suites** | Microsoft 365 | - | Google Workspace (Docs, Sheets, Slides) | - |
| **Email and calendar services** | Exchange Online, Outlook.com | Amazon WorkMail | Gmail, Google Calendar | - |
| **Project management tools** | Microsoft Planner, Microsoft Project | - | Google Keep, Google Tasks | - |

### Customer relationship management

Customer relationship management refers to technologies and practices that businesses use to manage customer data and interactions throughout the customer lifecycle.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Sales force automation** | Dynamics 365 Sales | - | - | - |
| **Marketing automation** | Dynamics 365 Marketing | Amazon Pinpoint | - | - |
| **Customer service and support** | Dynamics 365 Customer Service | Amazon Connect | - | - |

### Human capital management

Human capital management refers to the set of practices and tools used by organizations to recruit, manage, develop, and optimize their workforce.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Recruitment and hiring** | Dynamics 365 Talent | - | - | - |
| **Performance management** | Dynamics 365 Performance Management | - | - | - |
| **Time and attendance tracking** | Dynamics 365 Human Resources | - | - | - |

### Financial management

Financial management involves planning, organizing, directing, and controlling financial undertakings such as accounting, invoicing, and expense tracking.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Accounting and bookkeeping** | Dynamics 365 Finance | - | - | - |
| **Invoicing and billing** | Dynamics 365 Sales | - | - | - |
| **Expense tracking and reporting** | Dynamics 365 Expense | - | - | - |

### Marketing and advertising

Marketing and advertising solutions help businesses reach target audiences, promote products, manage campaigns, and analyze customer engagement.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Email marketing** | Dynamics 365 Marketing | Amazon Simple Email Service, Amazon Pinpoint | - | - |
| **Social media management** | Microsoft Social Engagement | - | - | - |
| **Search engine optimization** | Microsoft Advertising | - | Google Search Console | - |

### Security and identity (SaaS-level)

Security and identity at the SaaS level includes cloud-based solutions for managing user access, detecting threat patterns, and protecting encryption keys.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Identity and access management (IAM)** | Azure Active Directory | AWS IAM Identity Center, AWS IAM | Cloud Identity, Google Cloud IAM | Resource Access Management |
| **Threat detection and response** | Microsoft Threat Protection | Amazon GuardDuty, AWS Security Hub | Security Command Center | - |
| **Encryption and key management** | Azure Key Vault | AWS Key Management Service (KMS), AWS Secrets Manager | Cloud Key Management Service | Key Management Service |
| **Key management services** | Azure Key Vault | AWS KMS | Cloud Key Management Service | Key Management Service |

---

## Security, identity, and compliance

Security, identity, and compliance solutions protect cloud resources, manage user access, and ensure adherence to industry standards.

### Identity and access management (IAM)

Identity and access management (IAM) secures resources by authorizing users and devices.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Single sign-on (SSO)** | Microsoft Entra single sign-on (SSO) | AWS IAM Identity Center | Cloud Identity SSO | - |
| **Multifactor authentication** | Microsoft Entra multifactor authentication | AWS IAM multifactor authentication | Cloud Identity multifactor authentication / Google 2-Step Verification | - |
| **Role-based access control (RBAC)** | Azure RBAC, Microsoft Entra RBAC | AWS IAM Roles | Google Cloud IAM roles | - |

### Security information and event management (SIEM)

Security information and event management (SIEM) aggregates and analyzes security data to detect, investigate, and respond to potential threats.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Log collection and analysis** | Microsoft Sentinel | Amazon CloudWatch, Amazon OpenSearch Service | Cloud Logging, Google Security Operations (Chronicle SIEM) | - |
| **Threat detection and response** | Microsoft Defender Advanced Threat Protection (ATP), Microsoft 365 Threat Protection | Amazon GuardDuty, AWS Security Hub | Google Security Operations (Chronicle), Security Command Center | - |
| **Compliance reporting** | Microsoft Compliance Manager | AWS Artifact, AWS Audit Manager | Assured Workloads, Security Command Center | - |

### Data loss prevention (DLP)

Data loss prevention (DLP) identifies, monitors, and protects sensitive data to prevent its unauthorized disclosure or deletion.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Data encryption** | Azure Information Protection, Microsoft 365 ATP | AWS Key Management Service (KMS) | Cloud KMS, default encryption | - |
| **Data masking** | Azure Information Protection, Microsoft 365 ATP | Amazon Macie, AWS Glue DataBrew | Sensitive Data Protection (formerly Cloud DLP) | - |
| **Data redaction** | Azure Information Protection, Microsoft 365 ATP | Amazon Macie, Amazon Comprehend | Sensitive Data Protection (formerly Cloud DLP) | - |

### Compliance and governance

Compliance and governance solutions help organizations manage risk, meet regulatory requirements, and enforce organizational policies.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Audit and compliance reporting** | Microsoft Compliance Manager, Microsoft 365 ATP | AWS CloudTrail, AWS Audit Manager | Cloud Logging (audit logs), Assured Workloads | - |
| **Policy management** | Microsoft Intune, Microsoft 365 ATP | AWS Organizations, AWS Config | Organization Policy Service | - |
| **Risk management** | Microsoft Risk Management, Microsoft 365 ATP | AWS Audit Manager | Risk Manager, Security Command Center | - |

---

## Analytics and AI

AI and data analytics services enable organizations to process massive datasets and uncover actionable insights.

### Data analytics

Data analytics involves inspecting, cleaning, transforming, and modeling data to discover useful information.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Business intelligence tools** | Power BI | Amazon QuickSight | Looker | - |
| **Data visualization** | Power BI, Microsoft Power Apps | Amazon QuickSight | Looker, Looker Studio | - |
| **Predictive analytics** | Azure Machine Learning, Microsoft Power Apps | Amazon SageMaker, Amazon SageMaker Canvas | Vertex AI, BigQuery ML | - |

### Machine learning and AI

Machine learning and AI systems use algorithms and statistical models to analyze and draw inferences from patterns in data.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Natural language processing** | Azure Cognitive Services (Language), Microsoft Bot Framework | Amazon Comprehend, Amazon Lex | Cloud Natural Language API, Dialogflow | - |
| **Computer vision** | Azure Cognitive Services (Computer Vision), Microsoft Azure Media Services | Amazon Rekognition | Cloud Vision API, Vertex AI Vision | - |
| **Predictive modeling** | Azure Machine Learning, Microsoft Power Apps | Amazon SageMaker | Vertex AI, BigQuery ML | - |
| **Machine learning** | Azure Machine Learning | Amazon SageMaker | Vertex AI | Machine Learning Platform for AI |

### Internet of Things and edge computing

The Internet of Things (IoT) and edge computing bring data processing closer to the source of data generation.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Device management** | Microsoft Intune, Azure IoT Hub | AWS IoT Device Management | - *(Google Cloud IoT Core retired)* | - |
| **Data processing and analytics** | Azure IoT Hub, Azure Stream Analytics | AWS IoT Analytics, Amazon Kinesis | Dataflow, Pub/Sub | - |
| **Real-time processing** | Azure IoT Edge, Azure Stream Analytics | AWS IoT Greengrass, Amazon Kinesis | Dataflow, Pub/Sub | - |
| **IoT platforms** | Azure IoT Hub | AWS IoT Core | - *(Google Cloud IoT Core retired)* | Alibaba IoT Platform |

---

## Other cloud services

The following services provide specialized functionality, such as global content delivery, gaming, and robotics.

### Content delivery network

A content delivery network is a distributed group of servers that delivers web content efficiently to users.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Static content delivery** | Azure Content Delivery Network | Amazon CloudFront | Cloud CDN | Alibaba Cloud CDN |
| **Dynamic content delivery** | Azure Content Delivery Network with Azure Functions or Azure Logic Apps | Amazon CloudFront with Lambda@Edge | Cloud CDN | - |
| **Video streaming** | Azure Media Services, Azure Content Delivery Network with Azure Media Player | AWS Elemental Media Services, Amazon Interactive Video Service | Transcoder API, Live Stream API | - |

### Cloud gaming

Cloud gaming uses remote servers to run games and stream the video directly to a user's device.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Game streaming** | xCloud | Amazon Luna | - | - |
| **Cloud-based game development** | Microsoft Azure PlayFab, Microsoft Visual Studio | Amazon GameLift | - | - |

### Cloud telephony

Cloud telephony provides voice communication services over the internet without local hardware.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Voice over Internet Protocol** | Microsoft Teams, Azure Communication Services | Amazon Chime, Amazon Chime SDK | Google Voice | - |
| **Cloud-based contact centers** | Dynamics 365 Customer Service, Azure Communication Services | Amazon Connect | Contact Center AI | - |

### Cloud robotics

Cloud robotics integrates cloud computing with robotics to enhance data sharing, computation, and automation.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Robot Operating System (ROS)** | Microsoft Azure ROS, Microsoft Azure IoT Edge | AWS IoT Greengrass, AWS RoboMaker (retired) | - | - |
| **Cloud-based robotics development** | Microsoft Azure IoT Edge, Microsoft Visual Studio with Azure Robotics | AWS IoT Greengrass | - | - |

### Blockchain

Blockchain is a decentralized ledger technology that securely records transactions across a network.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Blockchain as a service** | Azure Blockchain Service | Amazon Managed Blockchain | Blockchain Node Engine | Ant Blockchain |

### Hybrid and multicloud

Hybrid and multicloud solutions combine multiple cloud environments to optimize performance and flexibility.

| Generic technology | Microsoft Azure | Amazon Web Services | Google Cloud Platform | Alibaba Cloud |
| :--- | :--- | :--- | :--- | :--- |
| **Hybrid cloud solutions** | Azure Arc | AWS Outposts, AWS Local Zones | Google Distributed Cloud, Anthos | Hybrid cloud solution by Alibaba |

