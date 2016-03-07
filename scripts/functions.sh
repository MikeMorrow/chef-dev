function cacheFile { # Arguments: CacheLocation fileName Source
  CacheLoc=$1
  fileName=$2
  Source=$3
  if [ ! -e ${CacheLoc}/${fileName} ]; then
    mkdir -p ${CacheLoc}
    echo "Downloading ${Source}"
    echo "  to ${CacheLoc}/${fileName}"
    wget --quiet -O ${CacheLoc}/${fileName} ${Source}
    echo "Download complete."
  fi
}
