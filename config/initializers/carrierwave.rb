CarrierWave.configure do |config|
    config.fog_credentials = {
        :provider                         => 'Google',
        :google_storage_access_key_id     => 'GOOGCZR5GYCKEUU7YYZ3XUZY',
        :google_storage_secret_access_key => 'VXKySrC2n328TBlmdllrTYW87mgQ/qxjh3oXfYwU'    
        }
    
        config.fog_directory = 'tuterostorage' 
    end