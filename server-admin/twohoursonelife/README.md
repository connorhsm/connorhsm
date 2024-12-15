# twohoursonelife
A Pterodactyl/Wisp.gg compatible egg for Two Hours One Life.

With a small player population, you can run this egg with 25% CPU, 256MB memory, and 256MB disk.

| File                          | Purpose                                                                                             |
| ----------------------------- | --------------------------------------------------------------------------------------------------- |
| `egg-two-hours-one-life.json` | An export of the Egg configuration once all put together                                            |
| `entrypoint.sh`               | Entrypoint for the Yolk container                                                                   |
| `install.sh`                  | Install script initiated by Pterodactyl/Wisp in the Installer container when triggered by the panel |
| `installer.Dockerfile`        | Installer container environment. 2HOL is built in this environment                                  |
| `yolk.Dockerfile`             | Yolk container environment. 2HOL is executed in this environment                                    |

## Improvement opportunities
- Safe stop of server
  - Using ini file
- Display info in dashboard
  - Version number
  - Player count
- Configure server port according to dashboard assigned port
- Variables for key config settings
  - Information for manually editing settings
  - Information on when to restart server
- Use tmp dir for building
