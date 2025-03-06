terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "< 1.0.0"
        }
    }
}

provider "vkcs" {
    # Your user account.
    username = "zolotoyy.artem@yandex.ru"

    # The password of the account
    password = "Sp1derm@n"

    # The tenant token can be taken from the project Settings tab - > API keys.
    # Project ID will be our token.
    project_id = "082365503cff4274bb84a76468f62ad9"
    
    # Region name
    region = "RegionOne"
    
    auth_url = "https://infra.mail.ru:35357/v3/" 
}

