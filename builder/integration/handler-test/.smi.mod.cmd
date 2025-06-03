savedcmd_smi.mod := printf '%s\n'   smi.o | awk '!x[$$0]++ { print("./"$$0) }' > smi.mod
