require "open-uri"

module MinecraftAssets
    class MinecraftAssetsGenerator < Jekyll::Generator 
        HeadsUrl = "https://mc-heads.net/avatar/"
        BodyUrl = "https://mc-heads.net/player/"

        def downloadImg(url, local_path)
            URI.open(url) do |image|
                File.open(local_path, "wb") do |file|
                    file.write(image.read)
                end
            end
        end

        def generate(site)
            staff_members = site.data["staff_members"]

            staff_members.each do | p |
                head_path = File.join(site.source, p["head_link"])
                avatar_path = File.join(site.source, p["avatar_link"])

                if !File.exist? head_path then
                    downloadImg(HeadsUrl + p["name"].chomp + ".png", head_path)
                end

                if !File.exist? avatar_path then
                    downloadImg(BodyUrl + p["name"].chomp + ".png", avatar_path)
                end
            end
        end
    end
end