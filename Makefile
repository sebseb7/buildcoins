all: ipbc alloy bbs edollar elya graft haven intense

ipbc_src:
	git clone https://github.com/ipbc-dev/ipbc.git ipbc_src

ipbc_src/build/Makefile: ipbc_src
	cd ipbc_src && mkdir build && cd build && cmake ..

ipbc_src/build/src/ipbcd: ipbc_src/build/Makefile
	cd ipbc_src/build && make -j8 Daemon

ipbc_src/build/src/simplewallet: ipbc_src/build/Makefile
	cd ipbc_src/build && make -j8 SimpleWallet

ipbc: ipbc_src/build/src/ipbcd ipbc_src/build/src/simplewallet


alloy_src:
	git clone --recursive https://github.com/alloyproject/alloy.git alloy_src

alloy_src/build/Makefile: alloy_src
	cd alloy_src && mkdir build && cd build && cmake ..

alloy_src/build/src/alloyd: ipbc_src/build/Makefile
	cd alloy_src/build && make -j8 Daemon

alloy_src/build/src/simplewallet: alloy_src/build/Makefile
	cd alloy_src/build && make -j8 SimpleWallet

alloy: alloy_src/build/src/alloyd alloy_src/build/src/simplewallet


bbs_src:
	git clone --recursive https://github.com/bbscoin/bbscoin.git bbs_src
	cd bbs_src && patch -p1 < ../bbs_patch

bbs_src/build/Makefile: bbs_src
	cd bbs_src && mkdir build && cd build && cmake ..

bbs_src/build/src/bbscoind: ipbc_src/build/Makefile
	cd bbs_src/build && make -j8 Daemon

bbs_src/build/src/simplewallet: bbs_src/build/Makefile
	cd bbs_src/build && make -j8 SimpleWallet

bbs: bbs_src/build/src/bbscoind bbs_src/build/src/simplewallet


edollar_src:
	git clone --recursive https://github.com/edollar-project/edollar.git edollar_src

edollar_src/build/Makefile: edollar_src
	cd edollar_src && mkdir build && cd build && cmake ..

edollar_src/build/bin/edollard: edollar_src/build/Makefile
	cd edollar_src/build && make -j8 daemon

edollar_src/build/bin/edollar-wallet-cli : edollar_src/build/Makefile
	cd edollar_src/build && make -j8 simplewallet

edollar: edollar_src/build/bin/edollard edollar_src/build/bin/edollar-wallet-cli


graft_src:
	git clone --recursive https://github.com/graft-project/GraftNetwork.git graft_src

graft_src/build/Makefile: graft_src
	cd graft_src && mkdir build && cd build && cmake ..

graft_src/build/bin/graftnoded: graft_src/build/Makefile
	cd graft_src/build && make -j8 daemon

graft_src/build/bin/graft-wallet-cli : graft_src/build/Makefile
	cd graft_src/build && make -j8 simplewallet

graft: graft_src/build/bin/graftnoded graft_src/build/bin/graft-wallet-cli


elya_src:
	git clone --recursive https://github.com/elyacoin/elyacoin.git elya_src

elya_src/build/Makefile: elya_src
	cd elya_src && mkdir build && cd build && cmake ..

elya_src/build/src/elyacoind: ipbc_src/build/Makefile
	cd elya_src/build && make -j8 Daemon

elya_src/build/src/simplewallet: elya_src/build/Makefile
	cd elya_src/build && make -j8 SimpleWallet

elya: elya_src/build/src/elyacoind elya_src/build/src/simplewallet


haven_src:
	git clone --recursive https://github.com/havenprotocol/haven.git haven_src

haven_src/build/Makefile: haven_src
	cd haven_src && mkdir build && cd build && cmake ..

haven_src/build/bin/havend: haven_src/build/Makefile
	cd haven_src/build && make -j8 daemon

haven_src/build/bin/haven-wallet-cli : haven_src/build/Makefile
	cd haven_src/build && make -j8 simplewallet

haven: haven_src/build/bin/havend haven_src/build/bin/haven-wallet-cli


intense_src:
	git clone --recursive https://github.com/valiant1x/intensecoin.git intense_src

intense_src/build/Makefile: intense_src
	cd intense_src && mkdir build && cd build && cmake ..

intense_src/build/bin/intensecoind: intense_src/build/Makefile
	cd intense_src/build && make -j8 daemon

intense_src/build/bin/intense-wallet-cli : intense_src/build/Makefile
	cd intense_src/build && make -j8 simplewallet

intense: intense_src/build/bin/intensecoind intense_src/build/bin/intense-wallet-cli


.PHONY : all ipbc alloy bbs edollar elya graft haven intense

