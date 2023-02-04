go 1.18

// THIS BRANCH CONTAINS STATE BREAKING CHANGES
// THIS BRANCH COULD REQUIRE AN UPGRADE HANDLER AND MAY NEED COORDINATION ABOUT THE MODULE VERSION MAP
// THIS CODE CARRIES NO GUARANTEE WHATSOEVER AND IS NOT SUPPORTED BY NOTIONAL LABS
// this build of Terra classic has been prepared by Jacob Gadikian of Notional Labs on Sunday, February 5th, 2023.
// Jacob has made numerous attempts to reach Ed Kim about these issues:
// 1) by twitter DM, where we previously corresponded frequently
// 2) by twitter, asking for secure contact information
// Ed Kim has replied:
// * https://twitter.com/edk208/status/1621895028883742725
// but cannot be reached for a private conversation about security issues.  This has been an ongoing issue with the L1 Task Force.

// this go.mod file has been marked up to indicate where issues lie.
// the issues are:
// 1. ibc-go is v1.1.5 instead of v1.1.7 <- FIXED IN THIS BRANCH
// 2. both ibc-go v1.1.5 and v1.1.7 have a transfer module that is an attack vector <- FIXED IN THIS BRANCH
// 3. wasmvm is subject to nearly every known issue that's been reported about cosmwasm over the past few years:
//    - halts
//    - state corruption
//    - memory exhaustion
//    - forking the chain into as many forks as there are validators
// 4. ibc-go v1.3.0 eliminates the risk found in v1.1.5 and v1.1.7, but upgrading wasn't a priority for Tobias from the L1 task force <- FIXED IN THIS BRANCH
// 5. The chain has too many keys for goleveldb to be performant
// 6. It is no longer possible to make archive nodes and no time was put into recreating a sync pattern.
// 7. Allnodes.com:
//    - DMs seed phrases to users
//    - tells users that seed phrases that they once knew can be deleted
//    - has somewhere over or under 1/3 of votepower
//    - holds keys to about 1/3rd of votepower's operator wallets
//    - proof: https://docs.google.com/document/d/1AIOOrHiNAFQKwzaeDNyJJJx8SwXNlaSUcZbasnezXS4/edit?usp=sharing
// 8. The layer one task force hasn't been responsive to any of this, placing Notional at risk.  So we departed.
//    - https://classic-agora.terra.money/t/falsehoods-promoted-by-the-l1-task-force/49913/14
//    - https://docs.google.com/document/d/1lDGQiUBbkwBPyRLFA3dnckBBHvYSL51JoqRlgPcCftA/edit?usp=sharing
//

module github.com/terra-money/core

require (
	github.com/CosmWasm/wasmvm v0.16.6 // this is an attack vector (halts and state corruption)
	github.com/cosmos/cosmos-sdk v0.44.6
	github.com/cosmos/ibc-go v1.3.0 // this is an attack vector (transfer module)
	github.com/gogo/protobuf v1.3.3
	github.com/golang/protobuf v1.5.2
	github.com/google/gofuzz v1.2.0
	github.com/gorilla/mux v1.8.0
	github.com/grpc-ecosystem/grpc-gateway v1.16.0
	github.com/pkg/errors v0.9.1
	github.com/rakyll/statik v0.1.7
	github.com/spf13/cast v1.4.1
	github.com/spf13/cobra v1.2.1
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.8.0
	github.com/tendermint/tendermint v0.34.14
	github.com/tendermint/tm-db v0.6.7
	google.golang.org/genproto v0.0.0-20211208223120-3a66f561d7aa
	google.golang.org/grpc v1.44.0
	gopkg.in/yaml.v2 v2.4.0
)

require (
	filippo.io/edwards25519 v1.0.0-beta.2 // indirect
	github.com/99designs/keyring v1.1.6 // indirect
	github.com/ChainSafe/go-schnorrkel v0.0.0-20200405005733-88cbf1b4c40d // indirect
	github.com/DataDog/zstd v1.4.5 // indirect
	github.com/Workiva/go-datastructures v1.0.52 // indirect
	github.com/armon/go-metrics v0.3.10 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bgentry/speakeasy v0.1.0 // indirect
	github.com/btcsuite/btcd v0.22.0-beta // indirect
	github.com/cespare/xxhash v1.1.0 // indirect
	github.com/cespare/xxhash/v2 v2.1.2 // indirect
	github.com/coinbase/rosetta-sdk-go v0.7.0 // indirect
	github.com/confio/ics23/go v0.7.0 // indirect
	github.com/cosmos/btcutil v1.0.4 // indirect
	github.com/cosmos/go-bip39 v1.0.0 // indirect
	github.com/cosmos/gorocksdb v1.2.0 // indirect
	github.com/cosmos/iavl v0.17.3 // indirect
	github.com/cosmos/ledger-cosmos-go v0.11.1 // indirect
	github.com/cosmos/ledger-go v0.9.2 // indirect
	github.com/danieljoos/wincred v1.0.2 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/desertbit/timer v0.0.0-20180107155436-c41aec40b27f // indirect
	github.com/dgraph-io/badger/v2 v2.2007.2 // indirect
	github.com/dgraph-io/ristretto v0.0.3 // indirect
	github.com/dgryski/go-farm v0.0.0-20200201041132-a6ae2369ad13 // indirect
	github.com/dustin/go-humanize v1.0.0 // indirect
	github.com/dvsekhvalnov/jose2go v0.0.0-20200901110807-248326c1351b // indirect
	github.com/felixge/httpsnoop v1.0.1 // indirect
	github.com/fsnotify/fsnotify v1.5.1 // indirect
	github.com/go-kit/kit v0.10.0 // indirect
	github.com/go-logfmt/logfmt v0.5.0 // indirect
	github.com/godbus/dbus v0.0.0-20190726142602-4481cbc300e2 // indirect
	github.com/gogo/gateway v1.1.0 // indirect
	github.com/golang/snappy v0.0.3 // indirect
	github.com/google/btree v1.0.0 // indirect
	github.com/google/orderedcode v0.0.1 // indirect
	github.com/gorilla/handlers v1.5.1 // indirect
	github.com/gorilla/websocket v1.4.2 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0 // indirect
	github.com/gsterjov/go-libsecret v0.0.0-20161001094733-a6f4afe4910c // indirect
	github.com/gtank/merlin v0.1.1 // indirect
	github.com/gtank/ristretto255 v0.1.2 // indirect
	github.com/hashicorp/go-immutable-radix v1.3.1 // indirect
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/hdevalence/ed25519consensus v0.0.0-20210204194344-59a8610d2b87 // indirect
	github.com/improbable-eng/grpc-web v0.14.1 // indirect
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/jmhodges/levigo v1.0.0 // indirect
	github.com/keybase/go-keychain v0.0.0-20190712205309-48d3d31d256d // indirect
	github.com/klauspost/compress v1.11.7 // indirect
	github.com/lib/pq v1.10.2 // indirect
	github.com/libp2p/go-buffer-pool v0.0.2 // indirect
	github.com/magiconair/properties v1.8.5 // indirect
	github.com/mattn/go-isatty v0.0.14 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/mimoo/StrobeGo v0.0.0-20181016162300-f8f6d4d2b643 // indirect
	github.com/minio/highwayhash v1.0.1 // indirect
	github.com/mitchellh/mapstructure v1.4.3 // indirect
	github.com/mtibben/percent v0.2.1 // indirect
	github.com/opencontainers/image-spec v1.0.2 // indirect
	github.com/opencontainers/runc v1.0.3 // indirect
	github.com/pelletier/go-toml v1.9.4 // indirect
	github.com/petermattis/goid v0.0.0-20180202154549-b0b1615b78e5 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_golang v1.11.0 // indirect
	github.com/prometheus/client_model v0.2.0 // indirect
	github.com/prometheus/common v0.29.0 // indirect
	github.com/prometheus/procfs v0.6.0 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20200313005456-10cdbea86bc0 // indirect
	github.com/regen-network/cosmos-proto v0.3.1 // indirect
	github.com/rs/cors v1.7.0 // indirect
	github.com/rs/zerolog v1.23.0 // indirect
	github.com/sasha-s/go-deadlock v0.2.1-0.20190427202633-1595213edefa // indirect
	github.com/spf13/afero v1.6.0 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/viper v1.10.1 // indirect
	github.com/subosito/gotenv v1.2.0 // indirect
	github.com/syndtr/goleveldb v1.0.1-0.20200815110645-5c35d600f0ca // indirect
	github.com/tendermint/btcd v0.1.1 // indirect
	github.com/tendermint/crypto v0.0.0-20191022145703-50d29ede1e15 // indirect
	github.com/tendermint/go-amino v0.16.0 // indirect
	github.com/zondax/hid v0.9.0 // indirect
	go.etcd.io/bbolt v1.3.6 // indirect
	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5 // indirect
	golang.org/x/net v0.0.0-20210903162142-ad29c8ab022f // indirect
	golang.org/x/sys v0.0.0-20211210111614-af8b64212486 // indirect
	golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1 // indirect
	golang.org/x/text v0.3.7 // indirect
	google.golang.org/protobuf v1.27.1 // indirect
	gopkg.in/ini.v1 v1.66.2 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	nhooyr.io/websocket v1.8.6 // indirect
)

replace (
	// cosmos keyring
	github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76

	// dragonberry patch
	github.com/confio/ics23/go => github.com/cosmos/cosmos-sdk/ics23/go v0.8.0

	// terra-flavored cosmos-sdk
	github.com/cosmos/cosmos-sdk => github.com/terra-rebels/cosmos-sdk v0.44.6-0.20221016182956-c5c6f52d0a59 // this sdk branch is in a terra-rebels repository and that's not desirable

	// terra-flavored ledger
	github.com/cosmos/ledger-cosmos-go => github.com/terra-money/ledger-terra-go v0.11.2

	// cosmos flavored protocol buffers
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1

	// terra-flavored tendermint
	github.com/tendermint/tendermint => github.com/terra-money/tendermint v0.34.14-terra.2 // this should be updated to v0.34.25, to prevent p2p issues that cause griefing which scales n+1 and could result in a halt

	// grpc compatible with cosmos flavored protobufs
	google.golang.org/grpc => google.golang.org/grpc v1.33.2
)
