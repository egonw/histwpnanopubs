RELEASES="20160610 \
 20160710 \
 20160810 \
 20160910 \
 20161010"

for release in ${RELEASES};
  do echo "${release}";
  mkdir -p ${release}
  cd ${release}
  echo "wget -c http://data.wikipathways.org/${release}/rdf/wikipathways-${release}-rdf-wp.zip"
  echo "unzip wikipathways-${release}-rdf-wp.zip"
  cd ..
done
