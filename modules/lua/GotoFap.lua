function Register()

    module.Name = 'GotoFap'
    module.Language = 'English'
    module.Adult = true

    module.Domains.Add('gotofap.org')

end

function GetInfo()

    info.Title = dom.SelectValue('//h1')
    info.Parody = dom.SelectValues('//name_tag[contains(text(), "Parody")]/following-sibling::info_tag//a')
    info.Characters = dom.SelectValues('//name_tag[contains(text(), "Character")]/following-sibling::info_tag//a')
    info.Artist = dom.SelectValues('//name_tag[contains(text(), "Artist")]/following-sibling::info_tag//a')
    info.Language = dom.SelectValues('//name_tag[contains(text(), "Language")]/following-sibling::info_tag//a')
    info.Type = dom.SelectValues('//name_tag[contains(text(), "Source")]/following-sibling::info_tag//a')
    info.Tags = dom.SelectValues('//name_tag[contains(text(), "Tags")]/following-sibling::info_tag//a')
    info.PageCount = dom.SelectValue('//name_tag[contains(text(), "Length")]/following-sibling::info_tag')

    -- Access the reader by following the link from the first thumbnail.

    info.Url = dom.SelectValue('//div[contains(@class, "gallery-icon")]/a/@href')

end

function GetPages()

    -- There is no consistent relationship between thumbnail URLs and full image URLs, so we need to get each page from the reader.

    for page in Paginator.New(http, dom, '//a[img[contains(@class,"btn_next")]]/@href') do

        pages.Add(page.SelectValue('//div[contains(@class,"entry-content")]//img/@src'))

    end

end
