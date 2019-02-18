all: wownero grin swap nerva safex xcash citi tyche qwerty arqma niobio b2b btcn lines triton iridium ombre ryo sumo solace arto karbo italo electroneum monero ipbc aeon bittube alloy bbs edollar elya graft monerov stellite masari loki haven intense

check: qwerty_check

grin_src:
	git clone https://github.com/mimblewimble/grin grin_src
wallet713_src:
	git clone https://github.com/vault713/wallet713.git wallet713_src

grin_src/target/release/grin: grin_src
	cd grin_src && cargo build --release

wallet713_src/target/release/wallet713: wallet713_src
	cd wallet713_src && cargo build --release

grin: grin_src/target/release/grin wallet713_src/target/release/wallet713

swap_src:
	git clone --recursive https://github.com/swap-dev/swap.git swap_src

swap_src/build/Makefile: swap_src
	cd swap_src && mkdir build && cd build && cmake ..

swap_src/build/src/swapd: swap_src/build/Makefile
	cd swap_src/build && make -j8 daemon blockchain_import blockchain_export

swap_src/build/src/swap-wallet-cli: swap_src/build/Makefile
	cd swap_src/build && make -j8 simplewallet wallet_rpc_server

swap: swap_src/build/src/swapd swap_src/build/src/swap-wallet-cli

italo: italo_src/build/src/italocoind italo_src/build/src/italocoin-wallet-cli

italo_src:
	git clone --recursive https://github.com/italocoin-project/italo.git italo_src

italo_src/build/Makefile: italo_src
	cd italo_src && mkdir build && cd build && cmake ..

italo_src/build/src/italod: italo_src/build/Makefile
	cd italo_src/build && make -j8 daemon blockchain_import blockchain_export

italo_src/build/src/italo-wallet-cli: italo_src/build/Makefile
	cd italo_src/build && make -j8 simplewallet wallet_rpc_server

italo: italo_src/build/src/italod italo_src/build/src/italo-wallet-cli

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
	git clone --recursive  --single-branch -b release-v0.13 https://github.com/monero-project/monero.git monero_src

monero_src/build/Makefile: monero_src
	cd monero_src && mkdir -p build && cd build && cmake ..

monero_src/build/src/monerod: monero_src/build/Makefile
	cd monero_src/build && make -j8 daemon blockchain_import blockchain_export

monero_src/build/src/monero-wallet-cli: monero_src/build/Makefile
	cd monero_src/build && make -j8 simplewallet

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
	cd alloy_src && (patch -p1 <../alloy_patch) && mkdir build && cd build && cmake ..

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
	cd karbo_src && (patch -p1 <../karbo_patch) && mkdir build && cd build && cmake ..

karbo_src/build/src/karbowanecd: karbo_src/build/Makefile
	cd karbo_src/build && make -j8 Daemon

karbo_src/build/src/simplewallet: karbo_src/build/Makefile
	cd karbo_src/build && make -j8 SimpleWallet 

karbo: karbo_src/build/src/karbowanecd karbo_src/build/src/simplewallet


bbs_src:
	git clone --recursive https://github.com/bbscoin/bbscoin.git bbs_src

bbs_src/build/Makefile: bbs_src
	cd bbs_src && (patch -p1 <../bbs_patch) && mkdir build && cd build && cmake ..

bbs_src/build/src/bbscoind: bbs_src/build/Makefile
	cd bbs_src/build && make -j8 Daemon

bbs_src/build/src/simplewallet: bbs_src/build/Makefile
	cd bbs_src/build && make -j8 SimpleWallet

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
	cd elya_src && (patch -p1 <../elya_patch) && mkdir build && cd build && cmake ..

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
	git clone --recursive https://github.com/LetheanMovement/lethean.git intense_src

intense_src/build/Makefile: intense_src
	cd intense_src && mkdir build && cd build && cmake ..

intense_src/build/bin/letheand: intense_src/build/Makefile
	cd intense_src/build && make -j8 daemon blockchain_import blockchain_export

intense_src/build/bin/lethean-wallet-cli : intense_src/build/Makefile
	cd intense_src/build && make -j8 simplewallet wallet_rpc_server

intense: intense_src/build/bin/letheand intense_src/build/bin/lethean-wallet-cli


solace_src:
	git clone --recursive https://github.com/schmeckles22/SolaceCoin.git solace_src

solace_src/build/Makefile: solace_src
	cd solace_src && mkdir build && cd build && cmake ..

solace_src/build/bin/solaced: solace_src/build/Makefile
	cd solace_src/build && make -j8 daemon blockchain_import blockchain_export

solace_src/build/bin/solace-wallet-cli : solace_src/build/Makefile
	cd solace_src/build && make -j8 simplewallet wallet_rpc_server

solace: solace_src/build/bin/solaced solace_src/build/bin/solace-wallet-cli



ryo_src:
	git clone --recursive https://github.com/ryo-currency/ryo-currency.git ryo_src

ryo_src/build/Makefile: ryo_src
	cd ryo_src && mkdir build && cd build && cmake ..

ryo_src/build/bin/ryod: ryo_src/build/Makefile
	cd ryo_src/build && make -j8 daemon blockchain_import blockchain_export

ryo_src/build/bin/ryo-wallet-cli : ryo_src/build/Makefile
	cd ryo_src/build && make -j8 simplewallet wallet_rpc_server

ryo: ryo_src/build/bin/ryod ryo_src/build/bin/ryo-wallet-cli


sumo_src:
	git clone --recursive https://github.com/sumoprojects/sumokoin.git sumo_src

sumo_src/build/Makefile: sumo_src
	cd sumo_src && mkdir build && cd build && cmake ..

sumo_src/build/bin/sumocoind: sumo_src/build/Makefile
	cd sumo_src/build && make -j8 daemon blockchain_import blockchain_export

sumo_src/build/bin/sumo-wallet-cli : sumo_src/build/Makefile
	cd sumo_src/build && make -j8 simplewallet wallet_rpc_server

sumo: sumo_src/build/bin/sumocoind sumo_src/build/bin/sumo-wallet-cli


ombre_src:
	git clone --recursive https://github.com/ombre-projects/ombre.git ombre_src

ombre_src/build/Makefile: ombre_src
	cd ombre_src && mkdir build && cd build && cmake ..

ombre_src/build/bin/ombred: ombre_src/build/Makefile
	cd ombre_src/build && make -j8 daemon blockchain_import blockchain_export

ombre_src/build/bin/ombre-wallet-cli : ombre_src/build/Makefile
	cd ombre_src/build && make -j8 simplewallet wallet_rpc_server

ombre: ombre_src/build/bin/ombred ombre_src/build/bin/ombre-wallet-cli


iridium_src:
	git clone --recursive https://github.com/iridiumdev/iridium.git iridium_src

iridium_src/build/Makefile: iridium_src
	cd iridium_src && (patch -p1 <../iridium_patch) && mkdir build && cd build && cmake ..

iridium_src/build/src/iridiumd: iridium_src/build/Makefile
	cd iridium_src/build && make -j8 Daemon

iridium_src/build/src/iridium_simplewallet: iridium_src/build/Makefile
	cd iridium_src/build && make -j8 SimpleWallet

iridium: iridium_src/build/src/iridiumd iridium_src/build/src/iridium_simplewallet

triton_src:
	git clone --recursive https://github.com/TritonNetwork/TritonProtocol triton_src

triton_src/build/Makefile: triton_src
	cd triton_src && mkdir build && cd build && cmake ..

triton_src/build/src/tritond: triton_src/build/Makefile
	cd triton_src/build && make -j8 daemon blockchain_import blockchain_export

triton_src/build/src/triton-wallet-cli: triton_src/build/Makefile
	cd triton_src/build && make -j8 simplewallet wallet_rpc_server

triton: triton_src/build/src/tritond triton_src/build/src/triton-wallet-cli

lines_src:
	git clone --recursive https://github.com/linescoin/lines.git  lines_src

lines_src/build/Makefile: lines_src
	cd lines_src && (patch -p1 <../lines_patch) && mkdir build && cd build && cmake ..

lines_src/build/src/linesd: lines_src/build/Makefile
	cd lines_src/build && make -j8 Daemon

lines_src/build/src/simplewallet: lines_src/build/Makefile
	cd lines_src/build && make -j8 SimpleWallet

lines: lines_src/build/src/linesd lines_src/build/src/simplewallet


btcn_src:
	git clone --recursive https://github.com/Bitcoinote/Bitcoinote-Core.git  btcn_src

btcn_src/build/Makefile: btcn_src
	cd btcn_src && (patch -p1 <../btcn_patch) && mkdir build && cd build && cmake ..

btcn_src/build/src/Bitcoinoted: btcn_src/build/Makefile
	cd btcn_src/build && make -j8 Daemon

btcn_src/build/src/simplewallet: btcn_src/build/Makefile
	cd btcn_src/build && make -j8 SimpleWallet

btcn: btcn_src/build/src/Bitcoinoted btcn_src/build/src/simplewallet


b2b_src:
	git clone --recursive https://github.com/oliviersinnaeve/b2bcoin.git b2b_src

b2b_src/build/Makefile: b2b_src
	cd b2b_src && mkdir build && cd build && cmake ..

b2b_src/build/src/b2bcoind: b2b_src/build/Makefile
	cd b2b_src/build && make -j8 Daemon

b2b_src/build/src/simplewallet: b2b_src/build/Makefile
	cd b2b_src/build && make -j8 SimpleWallet

b2b: b2b_src/build/src/b2bcoind b2b_src/build/src/simplewallet


tyche_src:
	git clone --recursive https://github.com/blockchain-next/TycheCash.git tyche_src

tyche_src/build/Makefile: tyche_src
	cd tyche_src && (patch -p1 <../tyche_patch) && mkdir build && cd build && cmake ..

tyche_src/build/src/TycheCash: tyche_src/build/Makefile
	cd tyche_src/build && make -j8 Daemon

tyche_src/build/src/simplewallet: tyche_src/build/Makefile
	cd tyche_src/build && make -j8 SimpleWallet

tyche: tyche_src/build/src/TycheCash tyche_src/build/src/simplewallet


niobio_src:
	git clone --recursive https://github.com/niobio-cash/niobio-node-daemon.git niobio_src

niobio_src/build/Makefile: niobio_src
	cd niobio_src && (patch -p1 <../niobio_patch) && mkdir build && cd build && cmake ..

niobio_src/build/src/niobiod: niobio_src/build/Makefile
	cd niobio_src/build && make -j8 Daemon

niobio_src/build/src/simplewallet: niobio_src/build/Makefile
	cd niobio_src/build && make -j8 SimpleWallet

niobio: niobio_src/build/src/niobiod niobio_src/build/src/simplewallet

wownero_src:
	git clone --recursive https://github.com/wownero/wownero.git wownero_src

wownero_src/build/Makefile: wownero_src
	cd wownero_src && git checkout 6177e8e062e4e80dc4b24e023a3b015807a51f31 && mkdir -p build && cd build && cmake ..

wownero_src/build/bin/wownerod: wownero_src/build/Makefile
	cd wownero_src/build && make -j8 daemon blockchain_import blockchain_export

wownero_src/build/bin/wownero-wallet-cli : wownero_src/build/Makefile
	cd wownero_src/build && make -j8 simplewallet wallet_rpc_server

wownero: wownero_src/build/bin/wownerod wownero_src/build/bin/wownero-wallet-cli


safex_src:
	git clone --recursive https://github.com/safex/safexcore.git safex_src

safex_src/build/Makefile: safex_src
	cd safex_src && mkdir -p build && cd build && cmake -D BUILD_WALLET_RPC=ON -D BUILD_ADVANCED_WALLET=ON ..

safex_src/build/bin/safexd: safex_src/build/Makefile
	cd safex_src/build && make -j8 daemon blockchain_import blockchain_export

safex_src/build/bin/safex-wallet-cli : safex_src/build/Makefile
	cd safex_src/build && make -j8 simplewallet wallet_rpc_server

safex: safex_src/build/bin/safexd safex_src/build/bin/safex-wallet-cli


xcash_src:
	git clone --recursive https://github.com/X-CASH-official/X-CASH.git xcash_src

xcash_src/build/Makefile: xcash_src
	cd xcash_src && mkdir build && cd build && cmake ..

xcash_src/build/bin/xcashd: xcash_src/build/Makefile
	cd xcash_src/build && make -j8 daemon blockchain_import blockchain_export

xcash_src/build/bin/xcash-wallet-cli : xcash_src/build/Makefile
	cd xcash_src/build && make -j8 simplewallet wallet_rpc_server

xcash: xcash_src/build/bin/xcashd xcash_src/build/bin/xcash-wallet-cli


citi_src:
	git clone --recursive https://github.com/citicashio/citicash.git citi_src

citi_src/build/Makefile: citi_src
	cd citi_src && mkdir build && cd build && cmake ..

citi_src/build/bin/citicashd: citi_src/build/Makefile
	cd citi_src/build && make -j8 daemon blockchain_import blockchain_export

citi_src/build/bin/citicash-wallet-cli : citi_src/build/Makefile
	cd citi_src/build && make -j8 simplewallet wallet_rpc_server

citi: citi_src/build/bin/citicashd citi_src/build/bin/citicash-wallet-cli


nerva_src:
	git clone --recursive https://github.com/angrywasp/nerva.git nerva_src

nerva_src/build/Makefile: nerva_src
	cd nerva_src && mkdir build && cd build && cmake ..

nerva_src/build/bin/nervad: nerva_src/build/Makefile
	cd nerva_src/build && make -j8 daemon blockchain_import blockchain_export

nerva_src/build/bin/nerva-wallet-cli : nerva_src/build/Makefile
	cd nerva_src/build && make -j8 simplewallet wallet_rpc_server

nerva: nerva_src/build/bin/nervad nerva_src/build/bin/nerva-wallet-cli


qwerty_src:
	git clone --recursive https://github.com/qwertycoin-org/qwertycoin.git qwerty_src

qwerty_check:
	@if [ -d "qwerty_src" ]; then cd qwerty_src ; git fetch -v --dry-run;  fi

qwerty_src/build/Makefile: qwerty_src
	cd qwerty_src && (patch -p1 <../qwerty_patch) && mkdir build && cd build && cmake ..

qwerty_src/build/src/qwertyd: qwerty_src/build/Makefile
	cd qwerty_src/build && make -j8 Daemon

qwerty_src/build/src/simplewallet: qwerty_src/build/Makefile
	cd qwerty_src/build && make -j8 SimpleWallet

qwerty: qwerty_src/build/src/qwertyd qwerty_src/build/src/simplewallet


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

#_src:
#	git clone --recursive  _src
#
#_src/build/Makefile: _src
#	cd _src && mkdir build && cd build && cmake ..
#
#_src/build/src/d: _src/build/Makefile
#	cd _src/build && make -j8 Daemon
#
#_src/build/src/simplewallet: _src/build/Makefile
#	cd _src/build && make -j8 SimpleWallet
#
#: _src/build/src/d _src/build/src/simplewallet


.PHONY : qwerty_check check all grin swap nerva safex xcash citi tyche qwerty wownero niobio b2b btcn lines triton iridium ombre ryo sumo solace italo arto karbo electroneum arqma monero aeon bittube ipbc alloy bbs edollar elya graft monerov stellite masari loki haven intense

