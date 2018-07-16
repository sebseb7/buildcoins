all: arqma ryo solace saronite arto karbo italo electroneum monero ipbc aeon bittube alloy bbs edollar elya graft monerov stellite masari loki haven intense

italo_src:
	git clone --recursive https://github.com/italocoin-project/italocoin.git italo_src

italo_src/build/Makefile: italo_src
	cd italo_src && mkdir build && cd build && cmake ..

italo_src/build/src/italocoind: italo_src/build/Makefile
	cd italo_src/build && make -j8 daemon blockchain_import blockchain_export

italo_src/build/src/italocoin-wallet-cli: italo_src/build/Makefile
	cd italo_src/build && make -j8 simplewallet wallet_rpc_server

italo: italo_src/build/src/italocoind italo_src/build/src/italocoin-wallet-cli

arqma_src:
	git clone --recursive https://github.com/arqma/arqma.git arqma_src

arqma_src/build/Makefile: arqma_src
	cd arqma_src && mkdir build && cd build && cmake ..

arqma_src/build/src/arqmad: arqma_src/build/Makefile
	cd arqma_src/build && make -j8 daemon blockchain_import blockchain_export

arqma_src/build/src/arqma-wallet-cli: arqma_src/build/Makefile
	cd arqma_src/build && make -j8 simplewallet wallet_rpc_server

arqma: arqma_src/build/src/arqmad arqma_src/build/src/arqma-wallet-cli

electroneum_src:
	git clone --recursive https://github.com/electroneum/electroneum.git electroneum_src

electroneum_src/build/Makefile: electroneum_src
	cd electroneum_src && mkdir build && cd build && cmake ..

electroneum_src/build/src/electroneumd: electroneum_src/build/Makefile
	cd electroneum_src/build && make -j8 daemon blockchain_import blockchain_export

electroneum_src/build/src/electroneum-wallet-cli: electroneum_src/build/Makefile
	cd electroneum_src/build && make -j8 simplewallet wallet_rpc_server

electroneum: electroneum_src/build/src/electroneumd electroneum_src/build/src/electroneum-wallet-cli

monero_src:
	git clone --recursive https://github.com/monero-project/monero.git monero_src

monero_src/build/Makefile: monero_src
	cd monero_src && mkdir build && cd build && cmake ..

monero_src/build/src/monerod: monero_src/build/Makefile
	cd monero_src/build && make -j8 daemon blockchain_import blockchain_export

monero_src/build/src/monero-wallet-cli: monero_src/build/Makefile
	cd monero_src/build && make -j8 simplewallet wallet_rpc_server

monero: monero_src/build/src/monerod monero_src/build/src/monero-wallet-cli

ipbc_src:
	git clone --recursive https://github.com/muncoin/ipbc.git ipbc_src

ipbc_src/build/Makefile: ipbc_src
	cd ipbc_src && mkdir build && cd build && cmake ..

ipbc_src/build/src/ipbcd: ipbc_src/build/Makefile
	cd ipbc_src/build && make -j8 daemon blockchain_import blockchain_export

ipbc_src/build/src/ipbc-wallet-cli: ipbc_src/build/Makefile
	cd ipbc_src/build && make -j8 simplewallet wallet_rpc_server

ipbc: ipbc_src/build/src/ipbcd ipbc_src/build/src/ipbc-wallet-cli

bittube_src:
	git clone --recursive https://github.com/ipbc-dev/bittube.git bittube_src

bittube_src/build/Makefile: bittube_src
	cd bittube_src && mkdir build && cd build && cmake ..

bittube_src/build/src/bittubed: bittube_src/build/Makefile
	cd bittube_src/build && make -j8 daemon blockchain_import blockchain_export

bittube_src/build/src/bittube-wallet-cli: bittube_src/build/Makefile
	cd bittube_src/build && make -j8 simplewallet wallet_rpc_server

bittube: bittube_src/build/src/bittubed bittube_src/build/src/bittube-wallet-cli

aeon_src:
	git clone --recursive https://github.com/aeonix/aeon.git aeon_src

aeon_src/build/Makefile: aeon_src
	cd aeon_src && mkdir build && cd build && cmake ..

aeon_src/build/src/aeond: aeon_src/build/Makefile
	cd aeon_src/build && make -j8 daemon blockchain_import blockchain_export

aeon_src/build/src/aeon-wallet-cli: aeon_src/build/Makefile
	cd aeon_src/build && make -j8 simplewallet wallet_rpc_server

aeon: aeon_src/build/src/aeond aeon_src/build/src/aeon-wallet-cli


alloy_src:
	git clone --recursive https://github.com/alloyproject/alloy.git alloy_src

alloy_src/build/Makefile: alloy_src
	cd alloy_src && mkdir build && cd build && cmake ..

alloy_src/build/src/alloyd: alloy_src/build/Makefile
	cd alloy_src/build && make -j8 Daemon

alloy_src/build/src/simplewallet: alloy_src/build/Makefile
	cd alloy_src/build && make -j8 SimpleWallet 

alloy: alloy_src/build/src/alloyd alloy_src/build/src/simplewallet


arto_src:
	git clone --recursive https://github.com/artocash/arto.git arto_src

arto_src/build/Makefile: arto_src
	cd arto_src && (patch -p1 <../arto_patch) && mkdir build && cd build && cmake ..

arto_src/build/src/artod: arto_src/build/Makefile
	cd arto_src/build && make -j8 Daemon

arto_src/build/src/simplewallet: arto_src/build/Makefile
	cd arto_src/build && make -j8 SimpleWallet 

arto: arto_src/build/src/artod arto_src/build/src/simplewallet


karbo_src:
	git clone --recursive https://github.com/seredat/karbowanec.git karbo_src

karbo_src/build/Makefile: karbo_src
	cd karbo_src && mkdir build && cd build && cmake ..

karbo_src/build/src/karbowanecd: karbo_src/build/Makefile
	cd karbo_src/build && make -j8 Daemon

karbo_src/build/src/simplewallet: karbo_src/build/Makefile
	cd karbo_src/build && make -j8 SimpleWallet 

karbo: karbo_src/build/src/karbowanecd karbo_src/build/src/simplewallet


bbs_src:
	git clone --recursive https://github.com/bbscoin/bbscoin.git bbs_src

bbs_src/build/Makefile: bbs_src
	cd bbs_src && mkdir build && cd build && cmake ..

bbs_src/build/src/bbscoind: bbs_src/build/Makefile
	cd bbs_src/build && make -j8 Daemon

bbs_src/build/src/simplewallet: bbs_src/build/Makefile
	cd bbs_src/build && make -j8 SimpleWallet wallet_rpc_server

bbs: bbs_src/build/src/bbscoind bbs_src/build/src/simplewallet


edollar_src:
	git clone --recursive https://github.com/edollar-project/edollar.git edollar_src

edollar_src/build/Makefile: edollar_src
	cd edollar_src && mkdir build && cd build && cmake ..

edollar_src/build/bin/edollard: edollar_src/build/Makefile
	cd edollar_src/build && make -j8 daemon blockchain_import blockchain_export

edollar_src/build/bin/edollar-wallet-cli : edollar_src/build/Makefile
	cd edollar_src/build && make -j8 simplewallet wallet_rpc_server

edollar: edollar_src/build/bin/edollard edollar_src/build/bin/edollar-wallet-cli


graft_src:
	git clone --recursive https://github.com/graft-project/GraftNetwork.git graft_src

graft_src/build/Makefile: graft_src
	cd graft_src && mkdir build && cd build && cmake ..

graft_src/build/bin/graftnoded: graft_src/build/Makefile
	cd graft_src/build && make -j8 daemon blockchain_import blockchain_export

graft_src/build/bin/graft-wallet-cli : graft_src/build/Makefile
	cd graft_src/build && make -j8 simplewallet wallet_rpc_server

graft: graft_src/build/bin/graftnoded graft_src/build/bin/graft-wallet-cli


elya_src:
	git clone --recursive https://github.com/elyacoin/elyacoin.git elya_src

elya_src/build/Makefile: elya_src
	cd elya_src && mkdir build && cd build && cmake ..

elya_src/build/src/elyacoind: elya_src/build/Makefile
	cd elya_src/build && make -j8 Daemon

elya_src/build/src/simplewallet: elya_src/build/Makefile
	cd elya_src/build && make -j8 SimpleWallet

elya: elya_src/build/src/elyacoind elya_src/build/src/simplewallet


haven_src:
	git clone --recursive https://github.com/havenprotocol/haven.git haven_src

haven_src/build/Makefile: haven_src
	cd haven_src && mkdir build && cd build && cmake ..

haven_src/build/bin/havend: haven_src/build/Makefile
	cd haven_src/build && make -j8 daemon blockchain_import blockchain_export

haven_src/build/bin/haven-wallet-cli : haven_src/build/Makefile
	cd haven_src/build && make -j8 simplewallet wallet_rpc_server

haven: haven_src/build/bin/havend haven_src/build/bin/haven-wallet-cli


loki_src:
	git clone --recursive https://github.com/loki-project/loki.git loki_src

loki_src/build/Makefile: loki_src
	cd loki_src && mkdir build && cd build && cmake ..

loki_src/build/bin/lokid: loki_src/build/Makefile
	cd loki_src/build && make -j8 daemon blockchain_import blockchain_export

loki_src/build/bin/loki-wallet-cli : loki_src/build/Makefile
	cd loki_src/build && make -j8 simplewallet wallet_rpc_server

loki: loki_src/build/bin/lokid loki_src/build/bin/loki-wallet-cli


masari_src:
	git clone --recursive https://github.com/masari-project/masari.git masari_src

masari_src/build/Makefile: masari_src
	cd masari_src && mkdir build && cd build && cmake ..

masari_src/build/bin/masarid: masari_src/build/Makefile
	cd masari_src/build && make -j8 daemon blockchain_import blockchain_export

masari_src/build/bin/masari-wallet-cli : masari_src/build/Makefile
	cd masari_src/build && make -j8 simplewallet wallet_rpc_server

masari: masari_src/build/bin/masarid masari_src/build/bin/masari-wallet-cli


stellite_src:
	git clone --recursive https://github.com/stellitecoin/Stellite.git stellite_src

stellite_src/build/Makefile: stellite_src
	cd stellite_src && mkdir build && cd build && cmake ..

stellite_src/build/bin/stellited: stellite_src/build/Makefile
	cd stellite_src/build && make -j8 daemon blockchain_import blockchain_export

stellite_src/build/bin/stellite-wallet-cli : stellite_src/build/Makefile
	cd stellite_src/build && make -j8 simplewallet wallet_rpc_server

stellite: stellite_src/build/bin/stellited stellite_src/build/bin/stellite-wallet-cli


monerov_src:
	git clone --recursive https://github.com/monerov/monerov.git monerov_src

monerov_src/build/Makefile: monerov_src
	cd monerov_src && mkdir build && cd build && cmake ..

monerov_src/build/bin/monerovd: monerov_src/build/Makefile
	cd monerov_src/build && make -j8 daemon blockchain_import blockchain_export

monerov_src/build/bin/monerov-wallet-cli : monerov_src/build/Makefile
	cd monerov_src/build && make -j8 simplewallet wallet_rpc_server

monerov: monerov_src/build/bin/monerovd monerov_src/build/bin/monerov-wallet-cli


intense_src:
	git clone --recursive https://github.com/valiant1x/intensecoin.git intense_src

intense_src/build/Makefile: intense_src
	cd intense_src && mkdir build && cd build && cmake ..

intense_src/build/bin/intensecoind: intense_src/build/Makefile
	cd intense_src/build && make -j8 daemon blockchain_import blockchain_export

intense_src/build/bin/intense-wallet-cli : intense_src/build/Makefile
	cd intense_src/build && make -j8 simplewallet wallet_rpc_server

intense: intense_src/build/bin/intensecoind intense_src/build/bin/intense-wallet-cli


solace_src:
	git clone --recursive https://github.com/schmeckles22/SolaceCoin.git solace_src

solace_src/build/Makefile: solace_src
	cd solace_src && mkdir build && cd build && cmake ..

solace_src/build/bin/solaced: solace_src/build/Makefile
	cd solace_src/build && make -j8 daemon blockchain_import blockchain_export

solace_src/build/bin/solace-wallet-cli : solace_src/build/Makefile
	cd solace_src/build && make -j8 simplewallet wallet_rpc_server

solace: solace_src/build/bin/solaced solace_src/build/bin/solace-wallet-cli


saronite_src:
	git clone --recursive https://github.com/Saronite/saronite.git saronite_src

saronite_src/build/Makefile: saronite_src
	cd saronite_src && mkdir build && cd build && cmake ..

saronite_src/build/bin/saronited: saronite_src/build/Makefile
	cd saronite_src/build && make -j8 daemon blockchain_import blockchain_export

saronite_src/build/bin/saronite-wallet-cli : saronite_src/build/Makefile
	cd saronite_src/build && make -j8 simplewallet wallet_rpc_server

saronite: saronite_src/build/bin/saronited saronite_src/build/bin/saronite-wallet-cli


ryo_src:
	git clone --recursive https://github.com/ryo-currency/ryo-currency.git ryo_src

ryo_src/build/Makefile: ryo_src
	cd ryo_src && mkdir build && cd build && cmake ..

ryo_src/build/bin/ryod: ryo_src/build/Makefile
	cd _src/build && make -j8 daemon blockchain_import blockchain_export

ryo_src/build/bin/ryo-wallet-cli : ryo_src/build/Makefile
	cd ryo_src/build && make -j8 simplewallet wallet_rpc_server

ryo: ryo_src/build/bin/ryod ryo_src/build/bin/ryo-wallet-cli


#_src:
#	git clone --recursive  _src
#
#_src/build/Makefile: _src
#	cd _src && mkdir build && cd build && cmake ..
#
#_src/build/bin/d: _src/build/Makefile
#	cd _src/build && make -j8 daemon blockchain_import blockchain_export
#
#_src/build/bin/-wallet-cli : _src/build/Makefile
#	cd _src/build && make -j8 simplewallet wallet_rpc_server
#
#: _src/build/bin/d _src/build/bin/-wallet-cli


.PHONY : all ryo solace saronite italo arto karbo electroneum arqma monero aeon bittube ipbc alloy bbs edollar elya graft monerov stellite masari loki haven intense

