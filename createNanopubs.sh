RELEASES=" \
 20161210 \
 20170210 \
 20170310 \
 20170410"

SUBSETS="wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9"

NANOPUBS="InteractionPubs \
 ComplexesPubs \
 PathwayParticipationPubs"

for release in ${RELEASES}; do
  echo "Processing ${release}";
  mkdir -p ${release}
  cd ${release}
  wget -c http://data.wikipathways.org/${release}/rdf/wikipathways-${release}-rdf-wp.zip
  unzip -n wikipathways-${release}-rdf-wp.zip
  for subset in ${SUBSETS}; do
    for pubtype in ${NANOPUBS}; do
      java -DOPSWPRDF=`pwd` -DSUBSETPREFIX=${subset} -Xms2G -Xmx2G -server -cp ../wikipathways.nanopubs-1-SNAPSHOT.jar nl.unimaas.bigcat.wikipathways.nanopubs.${pubtype}
    done
  done
  cd ..
done
