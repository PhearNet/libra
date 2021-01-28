initSidebarItems({"enum":[["NamedChain","A registry of named chain IDs Its main purpose is to improve human readability of reserved chain IDs in config files and CLI When signing transactions for such chains, the numerical chain ID should still be used (e.g. MAINNET has numeric chain ID 1, TESTNET has chain ID 2, etc)"]],"fn":[["deserialize_config_chain_id",""]],"struct":[["ChainId","Note: u7 in a u8 is uleb-compatible, and any usage of this should be aware that this field maybe updated to be uleb64 in the future"]]});