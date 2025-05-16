# Datex 📊

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/Shell_Script-4EAA25?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Made with Love](https://img.shields.io/badge/Made%20with-❤️-red.svg)](https://github.com/patricksferraz/datex)

> A powerful command-line tool for automated extraction of Brazilian public health data from DATASUS (Brazil's Unified Health System database).

## 🌟 Features

- **Automated Data Extraction**: Download public health data with a single command
- **Flexible Filtering**: Filter data by:
  - Years (2008 to present)
  - Months (January to December)
  - Brazilian States/Regions
- **Customizable Output**: Specify custom output directories
- **User-Friendly**: Intuitive command-line interface with helpful documentation
- **Extensible**: Designed to support multiple DATASUS data sources (currently supporting SIHSUS)

## 📋 Prerequisites

- Bash shell environment
- `curl` command-line tool
- Internet connection to access DATASUS FTP server

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/patricksferraz/datex.git
cd datex
```

2. Make the script executable:
```bash
chmod +x datex.sh
```

## 💻 Usage

### Basic Usage

Download all SIHSUS RD data from 2008 to current date:
```bash
./datex.sh -s SIHSUS -t RD
```

### Advanced Usage

#### Filter by Years
Download SIHSUS RD data for specific years:
```bash
./datex.sh -s SIHSUS -t RD -y 08 -y 09 -y 10 -y 11
```

#### Filter by Months
Download data for specific months across years:
```bash
./datex.sh -s SIHSUS -t RD -y 08 -y 09 -y 10 -y 11 -m 01 -m 02
```

#### Filter by Region
Download data for a specific Brazilian state:
```bash
./datex.sh -s SIHSUS -t RD -r BA  # For Bahia
./datex.sh -s SIHSUS -t RD -r SP  # For São Paulo
```

#### Custom Output Directory
Specify a custom output directory:
```bash
./datex.sh -s SIHSUS -t RD -o /path/to/output/directory
```

#### Get Help
View all available options:
```bash
./datex.sh -h
```

## 📊 Supported Data Sources

Currently, the following DATASUS data sources are supported:

| Source | Description | Status |
|--------|-------------|--------|
| SIHSUS | Hospital Information System | ✅ Available |
| CIH | Hospital Information Communication System | 🔜 Coming Soon |
| CIHA | Hospital and Outpatient Information Communication System | 🔜 Coming Soon |
| CMD | Minimum Data Set | 🔜 Coming Soon |
| CNES | National Registry of Health Facilities | 🔜 Coming Soon |
| SIASUS | Outpatient Information System | 🔜 Coming Soon |
| SIM | Mortality Information System | 🔜 Coming Soon |
| SINAN | Notifiable Diseases Information System | 🔜 Coming Soon |
| SINASC | Live Birth Information System | 🔜 Coming Soon |

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## �� Acknowledgments

- [DATASUS](http://www2.datasus.gov.br/DATASUS/index.php) for providing the public health data
- The Brazilian Ministry of Health for maintaining the health information systems
- The open-source community for inspiration and best practices

## 📫 Contact

Patrick Ferraz - [GitHub](https://github.com/patricksferraz)

Project Link: [https://github.com/patricksferraz/datex](https://github.com/patricksferraz/datex)

---

⭐️ If you find this project helpful, please give it a star on GitHub!
