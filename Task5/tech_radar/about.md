# How to use the Technology Radar

### Introduction

Edit this file to your needs to provide an introduction to the technology radar. Explain the purpose
of the radar and how it is created. This is a good place to explain the quadrants and rings, too.

### Contributing to the AOE Technology Radar

Contributions and source code of the AOE Tech Radar are on
GitHub: [AOE Tech Radar on GitHub](https://github.com/AOEpeople/aoe_technology_radar)

### How to run

Установить nvm
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
```

Установить Node:
```bash
nvm install 20
nvm use 20
```

Проверка:
```bash
node -v
```

Очистка:
```bash
rm -rf node_modules package-lock.json
npm cache clean --force
```

Запуск:
```bash
npm run build
npm run serve
```
