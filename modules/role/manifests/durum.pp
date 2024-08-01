class role::durum {
    include profile::base::production
    include profile::firewall
    include profile::firewall::nftables_throttling
    include profile::prometheus::nft_throttling_denylist
    include profile::durum
    include profile::nginx
    include profile::bird::anycast
}
