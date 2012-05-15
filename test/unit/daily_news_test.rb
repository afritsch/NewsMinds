require 'test_helper'

class DailyNewsTest < ActiveSupport::TestCase

  setup do
  
    content = "<?xml version='1.0' encoding='ISO-8859-15'?>
<rss version='2.0' xmlns:dc='http://purl.org/dc/elements/1.1/' xmlns:admin='http://webns.net/mvcb/' xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#' xmlns:content='http://purl.org/rss/1.0/modules/content/'>
   <channel>
      <title>nachrichten.at - Weltspiegel</title>
      <link>http://www.nachrichten.at/</link>
      <description>www.nachrichten.at</description>
      <language>de-DE</language>
      <pubDate>Tue, 15 May 2012 15:03:10 +0200</pubDate>
      <lastBuildDate>Tue, 15 May 2012 15:03:10 +0200</lastBuildDate>      <item>
         <pubDate>Tue, 15 May 2012 00:04:00 +0200</pubDate>
         <title><![CDATA[Menschheit braucht einen halben Planeten mehr als sie zur Verf?gung hat]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886113#ref=rss</link>
         <description><![CDATA[Der Befund, den der WWF Montag durch den holl&auml;ndischen Astronauten Andr&eacute; Kuipers in der Internationalen Raumstation ISS in 400 Kilometern H&ouml;he pr&auml;sentierte, ist dramatisch: Unser Planet ist laut dem globalen Umweltbericht &bdquo;Living Planet Report&ldquo; kr&auml;nker geworden.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/ipad/bilder_des_tages/554712_0_imagecrop_getimage.jpg' alt='' border='0' align='right'>Der Befund, den der WWF Montag durch den holl&auml;ndischen Astronauten Andr&eacute; Kuipers in der Internationalen Raumstation ISS in 400 Kilometern H&ouml;he pr&auml;sentierte, ist dramatisch: Unser Planet ist laut dem globalen Umweltbericht &bdquo;Living Planet Report&ldquo; kr&auml;nker geworden. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886113</guid>
      </item>
            <item>
         <pubDate>Tue, 15 May 2012 00:04:00 +0200</pubDate>
         <title><![CDATA[Katar plant zur Fu?ball-WM 2022 ein aufsehenerregendes Luxushotel]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886045#ref=rss</link>
         <description><![CDATA[Das Scheichtum Katar l&auml;sst mit einem neuen Megaprojekt aufhorchen.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/import/alfa/weltspiegel/618136_2_xio-fcmsimage-20120514184909-006011-4fb137856c7b4.4534b642-355a-4838-959c-1cd31fb8aaf9.jpg' alt='' border='0' align='right'>Das Scheichtum Katar l&auml;sst mit einem neuen Megaprojekt aufhorchen. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886045</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 21:30:00 +0200</pubDate>
         <title><![CDATA[USA fordern Timoschenko-Freilassung]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886270#ref=rss</link>
         <description><![CDATA[KIEW. Die USA dringen auf eine sofortige Freilassung der inhaftierten ukrainischen Ex-Regierungschefin Julia Timoschenko und weiterer Oppositioneller.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/ipad/ipadartikelbilder/609394_0_851_fa35a01f59b976ed71dd85f70db0f074.jpg' alt='' border='0' align='right'>KIEW. Die USA dringen auf eine sofortige Freilassung der inhaftierten ukrainischen Ex-Regierungschefin Julia Timoschenko und weiterer Oppositioneller. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886270</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 18:35:00 +0200</pubDate>
         <title><![CDATA[Mehr als tausend pal?stinensische H?ftlinge beendeten Hungerstreik]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886192#ref=rss</link>
         <description><![CDATA[RAMALLAH. Nach einer Einigung mit den israelischen Beh&ouml;rden &uuml;ber eine Erleichterung ihrer Haftbedingungen haben am Montag mehr als tausend pal&auml;stinensische H&auml;ftlinge ihren Hungerstreik beendet.]]></description>
         <content:encoded><![CDATA[ RAMALLAH. Nach einer Einigung mit den israelischen Beh&ouml;rden &uuml;ber eine Erleichterung ihrer Haftbedingungen haben am Montag mehr als tausend pal&auml;stinensische H&auml;ftlinge ihren Hungerstreik beendet. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886192</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 16:01:00 +0200</pubDate>
         <title><![CDATA[Leiche lag f?nf Jahre unbemerkt in Wohnung - bis Einbrecher kam]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886047#ref=rss</link>
         <description><![CDATA[HAGEN. Erst ein Einbrecher hat in Deutschland die mumifizierte Leiche einer Pensionistin f&uuml;nf Jahre nach deren einsamem Tod entdeckt.]]></description>
         <content:encoded><![CDATA[ HAGEN. Erst ein Einbrecher hat in Deutschland die mumifizierte Leiche einer Pensionistin f&uuml;nf Jahre nach deren einsamem Tod entdeckt. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,886047</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 10:56:00 +0200</pubDate>
         <title><![CDATA[Nepal: 15 Tote bei Flugzeugabsturz]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885422#ref=rss</link>
         <description><![CDATA[KATHMANDU. Bei einem Flugzeugabsturz in Nepal sind 15 Menschen ums Leben gekommen. Sechs Insassen &uuml;berlebten nach Polizeiangaben wie durch ein Wunder, als die mit indischen Pilgern besetzte Maschine am Montag beim Landeanflug auf Jomson im Annapurna-Gebirge gegen einen Berg prallte.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/artikelbilder/weltspiegel/617762_0_trauer.jpg' alt='' border='0' align='right'>KATHMANDU. Bei einem Flugzeugabsturz in Nepal sind 15 Menschen ums Leben gekommen. Sechs Insassen &uuml;berlebten nach Polizeiangaben wie durch ein Wunder, als die mit indischen Pilgern besetzte Maschine am Montag beim Landeanflug auf Jomson im Annapurna-Gebirge gegen einen Berg prallte. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885422</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 08:07:00 +0200</pubDate>
         <title><![CDATA[Drogenkartell-Massaker: 49 verst?mmelte Leichen in Mexiko gefunden]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885384#ref=rss</link>
         <description><![CDATA[MEXIKO STADT. In Mexiko nimmt der Drogenkrieg immer grausamere Z&uuml;ge an. Am Sonntag wurden an einer Schnellstra&szlig;e bei Monterrey im Norden des Landes 49 enthauptete Leichen gefunden. Den 43 M&auml;nnern und sechs Frauen wurden nach Angaben der Beh&ouml;rden auch H&auml;nde und F&uuml;&szlig;e abgeschnitten.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/artikelbilder/weltspiegel/617684_0_TBR27_MEXICO-SLAYIN_0514_11.jpg' alt='' border='0' align='right'>MEXIKO STADT. In Mexiko nimmt der Drogenkrieg immer grausamere Z&uuml;ge an. Am Sonntag wurden an einer Schnellstra&szlig;e bei Monterrey im Norden des Landes 49 enthauptete Leichen gefunden. Den 43 M&auml;nnern und sechs Frauen wurden nach Angaben der Beh&ouml;rden auch H&auml;nde und F&uuml;&szlig;e abgeschnitten. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885384</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 04:27:00 +0200</pubDate>
         <title><![CDATA[1,4 Millionen Besucher beim Hamburger Hafengeburtstag]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885303#ref=rss</link>
         <description><![CDATA[HAMBURG. Der 823. Hamburger Hafengeburtstag hat rund 1,4 Millionen Besucher angelockt. Von Freitag bis Sonntag str&ouml;mten G&auml;ste aus zahlreichen L&auml;ndern in die Hansestadt.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/artikelbilder/weltspiegel/617481_0_epa.jpg' alt='' border='0' align='right'>HAMBURG. Der 823. Hamburger Hafengeburtstag hat rund 1,4 Millionen Besucher angelockt. Von Freitag bis Sonntag str&ouml;mten G&auml;ste aus zahlreichen L&auml;ndern in die Hansestadt. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885303</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 03:05:00 +0200</pubDate>
         <title><![CDATA[Franzose w?rde f?r sein Wildschwein sterben]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,884997#ref=rss</link>
         <description><![CDATA[TOULOUSE. Der Franzose Yvan Blaise w&uuml;rde lieber sterben, als sein Wildschwein 'Bamby' herzugeben. Das Tier soll dem 83-j&auml;hrigen Pensionisten aus dem Dorf Saint-Paul-d'Espis in S&uuml;dwestfrankreich weggenommen und erschossen werden.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/artikelbilder/symbolbilder/617362_0_wildschwein.jpg' alt='' border='0' align='right'>TOULOUSE. Der Franzose Yvan Blaise w&uuml;rde lieber sterben, als sein Wildschwein 'Bamby' herzugeben. Das Tier soll dem 83-j&auml;hrigen Pensionisten aus dem Dorf Saint-Paul-d'Espis in S&uuml;dwestfrankreich weggenommen und erschossen werden. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,884997</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 00:04:00 +0200</pubDate>
         <title><![CDATA[Russische Maschine flog absichtlich tief]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885036#ref=rss</link>
         <description><![CDATA[JAKARTA/MOSKAU. Der Pilot des am Mittwoch im indonesischen Dschungel abgest&uuml;rzten russischen Flugzeugs hat vor dem Ungl&uuml;ck beim Kontrollturm um Erlaubnis ersucht, auf eine tiefere Flugh&ouml;he zu gehen.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/import/alfa/weltspiegel/617377_0_xio-fcmsimage-20120513180027-006006-4fafda9b78ac4.5985e760-8dce-4328-b70d-daaae8842c0f.jpg' alt='' border='0' align='right'>JAKARTA/MOSKAU. Der Pilot des am Mittwoch im indonesischen Dschungel abgest&uuml;rzten russischen Flugzeugs hat vor dem Ungl&uuml;ck beim Kontrollturm um Erlaubnis ersucht, auf eine tiefere Flugh&ouml;he zu gehen. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885036</guid>
      </item>
            <item>
         <pubDate>Mon, 14 May 2012 00:04:00 +0200</pubDate>
         <title><![CDATA[Zehntausende 'Emp?rte' protestierten in Spanien gegen die massiven Sparma?nahmen der Regierung]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885023#ref=rss</link>
         <description><![CDATA[MADRID. Kurz vor dem Gr&uuml;ndungstag der &bdquo;Emp&ouml;rten&ldquo;-Bewegung in Spanien haben am Samstag in zahlreichen St&auml;dten zehntausende Menschen gegen die Sparma&szlig;nahmen der konservativen Regierung protestiert.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/import/alfa/weltspiegel/617373_0_xio-fcmsimage-20120513180027-006007-4fafda9b7da87.787f4b5d-5a6a-4d6f-b4e7-a52c6cd78eac.jpg' alt='' border='0' align='right'>MADRID. Kurz vor dem Gr&uuml;ndungstag der &bdquo;Emp&ouml;rten&ldquo;-Bewegung in Spanien haben am Samstag in zahlreichen St&auml;dten zehntausende Menschen gegen die Sparma&szlig;nahmen der konservativen Regierung protestiert. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885023</guid>
      </item>
            <item>
         <pubDate>Sun, 13 May 2012 21:07:00 +0200</pubDate>
         <title><![CDATA[China plant angeblich Anschlag auf Dalai Lama]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885292#ref=rss</link>
         <description><![CDATA[LONDON. Der Dalai Lama, das religi&ouml;se Oberhaupt der Tibeter, f&uuml;rchtet ein Attentat auf ihn durch China. Peking trainiere Frauen, die ihn w&auml;hrend einer Segnung vergiften sollen, sagte der 76-J&auml;hrige.]]></description>
         <content:encoded><![CDATA[ <img src='http://www.nachrichten.at/storage/pic/artikelbilder/weltspiegel/617479_0_epa.jpg' alt='' border='0' align='right'>LONDON. Der Dalai Lama, das religi&ouml;se Oberhaupt der Tibeter, f&uuml;rchtet ein Attentat auf ihn durch China. Peking trainiere Frauen, die ihn w&auml;hrend einer Segnung vergiften sollen, sagte der 76-J&auml;hrige. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885292</guid>
      </item>
            <item>
         <pubDate>Sun, 13 May 2012 18:51:00 +0200</pubDate>
         <title><![CDATA[Erneut Dutzende Tote in Mexiko entdeckt]]></title>
         <link>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885173#ref=rss</link>
         <description><![CDATA[MEXIKO-STADT. In Mexiko sind am Wochenende erneut Dutzende Menschen get&ouml;tet worden. Allein im Bundesstaat Nuevo Leon fanden Sicherheitskr&auml;fte die Leichen von 37 Menschen.]]></description>
         <content:encoded><![CDATA[ MEXIKO-STADT. In Mexiko sind am Wochenende erneut Dutzende Menschen get&ouml;tet worden. Allein im Bundesstaat Nuevo Leon fanden Sicherheitskr&auml;fte die Leichen von 37 Menschen. ]]></content:encoded>
         <guid>http://www.nachrichten.at/nachrichten/weltspiegel/art17,885173</guid>
      </item>
      </channel>
</rss>"
    FakeWeb.register_uri(:get, 'http://www.nachrichten.at/storage/rss/rss/weltspiegel.xml', :body => content)
    
    loadRSSFeeds
    copyRSSIntoDatabase
  end
  
  def teardown
  end
  
  test "is DailyNews-list complete?" do
    
    DailyNews.all.each do |news| 
      assert_not_equal nil, news.title
      assert_not_equal nil, news.description
      assert_not_equal nil, news.clicks
      assert_not_equal nil, news.theme_url
    end
    
  end
  
  test "list all DailyNews without top story" do
    
    story = TopStory.create( :title => DailyNews.find( (rand * DailyNews.all.count).floor ).title, :description => DailyNews.find( (rand * DailyNews.all.count).floor ).description, :chosen => 0 )
    
    news = DailyNews.onlyThemes # story must not be in the list
    
    for i in 0...news.count do
      assert_equal true, news[i].title != story.title 
    end
    
  end
  
end
