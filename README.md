# FRE2026 FloriBot 1.0 Docker

Containerisierte Umgebung für den FloriBot 1.0 auf Basis von ROS 2 Jazzy.

---

## Überblick

Dieses Repository enthält:

- Dockerfiles für:
  - Base (Kinematics + Hardware)
  - Webteleop
- Docker Compose Setup
- Startskripte

Die ROS-Pakete liegen in separaten Repositories und werden hier eingebunden.

---

## Repository-Struktur
FRE2026_FloriBot1.0_Docker/
├── repos/
│ ├── FloriBot1.0_ROS2_Jazzy_Base/
│ └── Webteleop_ROS2_Jazzy_V1/
├── base/
├── webteleop/
├── compose/
├── scripts/
└── README.md


---

## Setup

### 1. Repository klonen

```bash
git clone https://github.com/Team-FloriBot/FRE2026_FloriBot1.0_Docker.git
cd FRE2026_FloriBot1.0_Docker

### 2. Repositories klonen
mkdir -p repos
git clone https://github.com/Team-FloriBot/FloriBot1.0_ROS2_Jazzy_Base repos/FloriBot1.0_ROS2_Jazzy_Base
git clone https://github.com/Team-FloriBot/Webteleop_ROS2_Jazzy_V1 repos/Webteleop_ROS2_Jazzy_V1

Konfiguration
cp compose/.env.example compose/.env

Build
./scripts/build.sh

oder:

cd compose
docker compose build
Start
./scripts/up.sh

oder:

cd compose
docker compose up
Stop
./scripts/down.sh
Logs
./scripts/logs.sh
