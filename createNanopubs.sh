RELEASES="20160610 \
 20160710 \
 20160810 \
 20160910 \
 20161010"

SUBSETS="wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9"

NANOPUBS="InteractionPubs \
 ComplexesPubs \
 PathwayParticipationPubs"

for release in ${RELEASES}; do
  echo "${release}";
  mkdir -p ${release}
  cd ${release}
  echo "wget -c http://data.wikipathways.org/${release}/rdf/wikipathways-${release}-rdf-wp.zip"
  echo "unzip wikipathways-${release}-rdf-wp.zip"
  for subset in ${SUBSETS}; do
    for pubtype in ${NANOPUBS}; do
      echo "java -DOPSWPRDF=`pwd`/${release} -DSUBSETPREFIX=${subset} -Xms2G -Xmx2G -server -cp wikipathways.nanopubs-1-SNAPSHOT.jar nl.unimaas.bigcat.wikipathways.nanopubs.${pubtype}"
    done
  done
  cd ..
done
