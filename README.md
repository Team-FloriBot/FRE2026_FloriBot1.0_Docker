# FRE2026 FloriBot1.0 Docker

## Ziel
Containerisierung des FloriBot 1.0 mit ROS 2 Jazzy.

## Services
- Base (Kinematics + Hardware)
- Webteleop

## Voraussetzungen
- Linux Host
- Docker + Docker Compose Plugin
- Zugriff auf /dev (USB, Serial)
- Host Networking erforderlich

## Setup

Repositories in den Ordner `repos/` legen:

- FloriBot1.0_ROS2_Jazzy_Base
- Webteleop_ROS2_Jazzy_V1

## Konfiguration

```bash
cp compose/.env.example compose/.env
