#!/bin/bash
cd /var/canvas

read -p "Enter website domain: " domain
read -p "Enter RCE API subdomain: " subdomain
export DOMAIN=$domain
export RCE_SUBDOMAIN=$subdomain

echo "***CREATING config/dynamic_settings.yml***"

echo "# this config file is useful if you don't want to run a consul
# cluster with canvas.  Just provide the config data you would
# like for the DynamicSettings class to find, and it will use
# it whenever a call for consul data is issued. Data should be
# shaped like the example below, one key for the related set of data,
# and a hash of key/value pairs (no nesting)
production:
  # tree
  config:
    # service
    canvas:
      # environment
      canvas:
        # regexes for matching online meeting urls in calendar events
        # one per line. will get | or'd together to form the regex
        # that's eventually used.
        # Values here override the default values in
        # lib/api/v1/planner_item.rb:online_meeting_url
        # The example values here match what is (currently) in planner_item.rb
        online-meeting-url-regex: |-
          https:\/\/[\w-]+\.zoom\.us\/\d+(\?[\w\/\-=%]*)?
          https:\/\/[\w-]+\.zoom\.us\/my\/[\w.]+(\?[\w\/\-=%]*)?
          https:\/\/[\w-]+\.zoom\.us\/j\/\d+(\?[\w\/\-=%]*)?
          https:\/\/teams\.microsoft\.com\/l\/meetup-join\/[\w.\/\-=%]+(\?[\w\/\-=%]*)?
          https:\/\/teams\.live\.com\/meet\/\d+(\?[\w\/\-=%]*)?
          https:\/\/[\w-]+\.webex\.com\/meet\/[\w.\/\-=%]+(\?[\w\/\-=%]*)?
          https:\/\/[\w-]+\.webex\.com\/\w+\/j\.php(\?[\w\/\-=%]*)?
          https:\/\/meet\.google\.com\/[\w\/\-=%]+(\?[\w\/\-=%]*)?
          https?:\/\/.*\/conferences\/\d+\/join
      datadog-rum:
        application_id: "27627d1e-8a4f-4645-b390-bb396fc83c81"
        client_token: "a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r"
        sample_rate_percentage: 0.0 # Between 0.0 and 100.0; 0.0 disables the feature.
      live-events:
        aws_endpoint: http://kinesis.canvaslms.docker
        kinesis_stream_name: live-events
        aws_access_key_id: key
        aws_secret_access_key_dec: secret
        # stub_credentials: true # can be used in dev to print creds to stdout
      live-events-subscription-service:
        # Causes errors installing LTI 2 originality tools if not set up correctly
        # Comment out or set to false to use the live events ecosystem
        # LTI 2 Originality Report tools will not work properly without
        # the live events ecosystem set up
        # disabled: true
        app-host: "http://les.docker"
        sad-panda: null
      lti:
        # Used by ContextExternalTool#internal_service? to determine if
        # an Instructure-owned tool is launching to an Instructure-owned URL.
        # For OSS users: If you have a use case for marking your own tools as
        # "internal services", then replace this with your tool launch domains,
        # but this should rarely (if ever) be needed and can be safely ignored.
        # Domains should not have a preceding "." (ex: "instructure.com")
        internal_tool_domain_allowlist:
          - 'docker'
          - 'localhost'
      math-man:
        base_url: 'http://mathman.docker'
        use_for_svg: 'false'
        use_for_mml: 'false'
      microsoft-sync:
        client-id: some_client_id
        client-secret: some_client_secret
      rich-content-service:
        # if you're running canvas-rce-api on its own
        app-host: "$RCE_SUBDOMAIN"
        # if you're running canvas-rce-api with docker-compose/rce-api.override.yml in .env
        # app-host: "http://rce.canvas.docker:3000"
      common_cartridge_viewer:
        base_url: "http://localhost:3300"
      fullstory:
        sampling_rate: '0.0' # randomly inject this fraction of the time
        app_key: 'xyzzy'
    # another service
    inst-fs:
      app-host: "http://api.inst-fs.docker"
      # this is just "super-sekret-value", base64-encoded:
      secret: "c3VwZXItc2VrcmV0LXZhbHVlCg=="
    pandata:
      ios-pandata-key: IOS_pandata_key
      ios-pandata-secret: teamrocketblastoffatthespeedoflight
      android-pandata-key: ANDROID_pandata_key
      android-pandata-secret: surrendernoworpreparetofight

  private:
    canvas:
      auditors.yml: |
        write_paths:
          - active_record
        read_path: active_record
      # datadog_apm.yml: |
      #   sample_rate: 0.0
      #   host_sample_rate: 0.0
      # use a unique subdomain per attachment, so that browsers will enforce security
      # permissions (such as microphone/camera access) per-file. You must have wildcard
      # DNS set up for this to work.
      # attachment_specific_file_domain: true
      # ha_cache.yml: |
      #   cache_store: ha_store
      #   servers:
      #    - redis://localhost/2
      #   # keep stale data for up to 1 week in the cache
      #   race_condition_ttl: 604800
      #   # how long it might take to recompute a cache value
      #   # before the lock times out and another process is
      #   # allowed to write it
      #   lock_timeout: 5
      #   # how long before a cache entry is considered stale
      #   expires_in: 300
      #   # when deleting from the cache, trigger a consul event
      #   # you can use the example script/consume_consul_events
      #   # to delete from local nodes, but may need to tweak
      #   # slightly if your config doesn't match
      #   consul_event: "canvas/dev/invalidate_ha_cache"
      #   # if configured, trigger the event in multiple Consul
      #   # datacenters, rather than just the local one
      #   # if you use this you SHOULD still list the local
      #   # dc; it won't be added for you
      #   consul_datacenters:
      #   - dc1
      #   - dc2
      # clone_url_strand.yml: |
      #   lti1.instructure.com: lti1
      #   lti2.instructure.com: lti2
      # csp_logging.yml: |
      #   host: https://csplogging.inscloudgate.net/
      #   shared_secret: s00p3r_s3cr3t
      # To work with the release notes UI, uncomment this and ensure you have vault_contents.yml
      # with the example contents.  Also see docker-compose/dynamodb.override.yml
      # release_notes.yml: |
      #   ddb_endpoint: 'http://dynamo:8000/'
      #   ddb_table_name: 'canvas-release-notes'
      #   vault_credential_path: 'sts/testaccount/sts/canvas-release-notes'
      # feature_analytics:
      #   cache_expiry: '86400'
      #   sampling_rate: '0.0'
      #   queue_url: ''
      #   region: 'us-west-2'
  store:
    canvas:
      lti-keys:
        # these are all the same JWK but with different kid
        # to generate a new key, run the following in a Canvas console:
        #
        # key = OpenSSL::PKey::RSA.generate(2048)
        # key.public_key.to_jwk(kid: Time.now.utc.iso8601).to_json
        jwk-past.json: "{\"kty\":\"RSA\",\"e\":\"AQAB\",\"n\":\"uX1MpfEMQCBUMcj0sBYI-iFaG5Nodp3C6OlN8uY60fa5zSBd83-iIL3n_qzZ8VCluuTLfB7rrV_tiX727XIEqQ\",\"kid\":\"2018-05-18T22:33:20Z\",\"d\":\"pYwR64x-LYFtA13iHIIeEvfPTws50ZutyGfpHN-kIZz3k-xVpun2Hgu0hVKZMxcZJ9DkG8UZPqD-zTDbCmCyLQ\",\"p\":\"6OQ2bi_oY5fE9KfQOcxkmNhxDnIKObKb6TVYqOOz2JM\",\"q\":\"y-UBef95njOrqMAxJH1QPds3ltYWr8QgGgccmcATH1M\",\"dp\":\"Ol_xkL7rZgNFt_lURRiJYpJmDDPjgkDVuafIeFTS4Ic\",\"dq\":\"RtzDY5wXr5TzrwWEztLCpYzfyAuF_PZj1cfs976apsM\",\"qi\":\"XA5wnwIrwe5MwXpaBijZsGhKJoypZProt47aVCtWtPE\"}"
        jwk-present.json: "{\"kty\":\"RSA\",\"e\":\"AQAB\",\"n\":\"uX1MpfEMQCBUMcj0sBYI-iFaG5Nodp3C6OlN8uY60fa5zSBd83-iIL3n_qzZ8VCluuTLfB7rrV_tiX727XIEqQ\",\"kid\":\"2018-06-18T22:33:20Z\",\"d\":\"pYwR64x-LYFtA13iHIIeEvfPTws50ZutyGfpHN-kIZz3k-xVpun2Hgu0hVKZMxcZJ9DkG8UZPqD-zTDbCmCyLQ\",\"p\":\"6OQ2bi_oY5fE9KfQOcxkmNhxDnIKObKb6TVYqOOz2JM\",\"q\":\"y-UBef95njOrqMAxJH1QPds3ltYWr8QgGgccmcATH1M\",\"dp\":\"Ol_xkL7rZgNFt_lURRiJYpJmDDPjgkDVuafIeFTS4Ic\",\"dq\":\"RtzDY5wXr5TzrwWEztLCpYzfyAuF_PZj1cfs976apsM\",\"qi\":\"XA5wnwIrwe5MwXpaBijZsGhKJoypZProt47aVCtWtPE\"}"
        jwk-future.json: "{\"kty\":\"RSA\",\"e\":\"AQAB\",\"n\":\"uX1MpfEMQCBUMcj0sBYI-iFaG5Nodp3C6OlN8uY60fa5zSBd83-iIL3n_qzZ8VCluuTLfB7rrV_tiX727XIEqQ\",\"kid\":\"2018-07-18T22:33:20Z\",\"d\":\"pYwR64x-LYFtA13iHIIeEvfPTws50ZutyGfpHN-kIZz3k-xVpun2Hgu0hVKZMxcZJ9DkG8UZPqD-zTDbCmCyLQ\",\"p\":\"6OQ2bi_oY5fE9KfQOcxkmNhxDnIKObKb6TVYqOOz2JM\",\"q\":\"y-UBef95njOrqMAxJH1QPds3ltYWr8QgGgccmcATH1M\",\"dp\":\"Ol_xkL7rZgNFt_lURRiJYpJmDDPjgkDVuafIeFTS4Ic\",\"dq\":\"RtzDY5wXr5TzrwWEztLCpYzfyAuF_PZj1cfs976apsM\",\"qi\":\"XA5wnwIrwe5MwXpaBijZsGhKJoypZProt47aVCtWtPE\"}"
test:
  config:
    canvas:
      live-events-subscription-service:
        # disabled: true
        app-host: http://live-event-service
" | sudo tee config/dynamic_settings.yml