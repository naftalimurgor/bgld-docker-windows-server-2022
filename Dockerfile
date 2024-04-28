FROM  mcr.microsoft.com/windows/server:ltsc2022 as WindowsServer2022

ARG VERSION=0.1.11

RUN cd /d %TEMP% \
  if not exist "%TEMP%" mkdir "%TEMP%"\
  REM Download the file \
  curl -o BGL-%VERSION%-win64-setup.exe https://github.com/BitgesellOfficial/bitgesell/releases/download/%VERSION%/BGL-%VERSION%-win64-setup.exe \
  ./BGL-%VERSION%-win64-setup.exe

FROM WindowsServer2022

ENTRYPOINT ["docker-entrypoint.bat"]

VOLUME [ "C:\.BGL" ]

WORKDIR C:\.BGL

COPY .\cmd\ .\docker-entrypoint.bat %SystemDrive%\Program Files\

EXPOSE 8455

CMD ["bgl_oneshot"]

