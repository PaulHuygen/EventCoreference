DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT="$( cd $DIR && cd .. && pwd)"
LIB="$ROOT"/lib
REL="has_hyperonym#event#has_hypernym"

RESOURCES="$( cd $ROOT && cd .. && pwd)"/vua-resources
# assumes vua-resources is installed next to this installation
# git clone https://github.com/cltl/vua-resources.git

#pass naf file as input stream and catch the naf output stream
# for example> "cat example-naf.xml | event-coreference.sh > example-naf.coref.xml"

java -Xmx812m -cp "$LIB/EventCoreference-v3.1.2-jar-with-dependencies.jar" eu.newsreader.eventcoreference.naf.EventCorefWordnetSim --method leacock-chodorow --wn-lmf "$RESOURCES/wneng-30.lmf.xml.xpos.gz" --sim 2.0 --sim-ont 0.6 --wsd 0.8 --relations $REL wn-prefix "eng" --source-frames "$RESOURCES/source.txt" --grammatical-frames "$RESOURCES/grammatical.txt" --contextual-frames "$RESOURCES/contextual.txt"
