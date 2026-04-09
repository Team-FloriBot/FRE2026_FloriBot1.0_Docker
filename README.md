# FRE2026 FloriBot 1.0 Docker

Containerisierte Umgebung für den FloriBot 1.0 auf Basis von ROS 2 Jazzy.

---

## Überblick

Dieses Repository stellt eine modulare Docker-Infrastruktur für den FloriBot 1.0 bereit.

**Features:**

- Trennung in reale Hardware und Simulation
- Unterstützung für:
  - Base (Kinematics + Hardware)
  - Webteleop
  - Stage (Simulation)
  - Gazebo (Simulation)
- Docker Compose mit Profilen
- Wiederverwendbare Build- und Startskripte

---

## Repository-Struktur
FRE2026_FloriBot1.0_Docker/<br>
├── repos/<br>
├── base/<br>
├── webteleop/<br>
├── stage/<br>
├── gazebo/<br>
├── compose/<br>
├── scripts/<br>
└── README.md<br>


---

## Installation

### 1. Repository klonen

```bash
git clone https://github.com/Team-FloriBot/FRE2026_FloriBot1.0_Docker.git
cd FRE2026_FloriBot1.0_Docker
```
### 2. ROS-Repositories klonen
```bash
mkdir -p repos
git clone https://github.com/Team-FloriBot/FloriBot1.0_ROS2_Jazzy_Base repos/FloriBot1.0_ROS2_Jazzy_Base
git clone https://github.com/Team-FloriBot/Webteleop_ROS2_Jazzy_V1 repos/Webteleop_ROS2_Jazzy_V1
```
### 3. Konfiguration
```bash
cp compose/.env.example compose/.env
```
### 4. Build
```bash
cd compose
docker compose build
```
### 5. Start
```bash
cd compose
docker compose up
```
### 6. Starten einzelnzer Profile
| Profil               | Beschreibung          |
| -------------------- | --------------------- |
| `floribot-base`      | Hardware + Kinematics |
| `floribot-webteleop` | Webbasierte Steuerung |
| `floribot-stage`     | Simulation (Stage)    |
| `floribot-gazebo`    | Simulation (Gazebo)   |


Die Umgebung ist über Profile strukturiert.
<h2>Docker Compose Profile</h2>

<h3>Core / Robot</h3>
<ul>
  <li><code>core</code></li>
  <li><code>robot</code></li>
</ul>

<p>Startet:</p>
<ul>
  <li>floribot-base</li>
  <li>floribot-webteleop</li>
</ul>

<h3>UI</h3>
<ul>
  <li><code>ui</code></li>
</ul>

<p>Startet:</p>
<ul>
  <li>floribot-webteleop</li>
</ul>

<h3>Simulation</h3>
<ul>
  <li><code>sim</code></li>
</ul>

<p>Startet:</p>
<ul>
  <li>floribot-stage</li>
  <li>floribot-gazebo</li>
</ul>

<h3>Stage</h3>
<ul>
  <li><code>stage</code></li>
</ul>

<p>Startet:</p>
<ul>
  <li>floribot-stage</li>
</ul>

<h3>Gazebo</h3>
<ul>
  <li><code>gazebo</code></li>
</ul>

<p>Startet:</p>
<ul>
  <li>floribot-gazebo</li>
</ul>

<hr>

<h2>Profile starten</h2>

<h3>Robotik-System</h3>
<pre><code>docker compose --profile core up
</code></pre>

<h3>Nur Webteleop</h3>
<pre><code>docker compose --profile ui up
</code></pre>

<h3>Simulation komplett</h3>
<pre><code>docker compose --profile sim up
</code></pre>

<h3>Nur Stage</h3>
<pre><code>docker compose --profile stage up
</code></pre>

<h3>Nur Gazebo</h3>
<pre><code>docker compose --profile gazebo up
</code></pre>

<h3>Mehrere Profile kombinieren</h3>
<pre><code>docker compose --profile core --profile sim up
</code></pre>

<h3>Im Hintergrund</h3>
<pre><code>docker compose --profile core up -d
</code></pre>

<hr>

<h2>Stoppen</h2>

<h3>Alle Container</h3>
<pre><code>docker compose down
</code></pre>
