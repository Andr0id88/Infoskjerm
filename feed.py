import feedparser
import socket
import sys

class RssFeed:


    def internet_connected(host="8.8.8.8", port=53):

        """
        Sjekker om raspberrypien har internett connection. Den bruker følgende parameter:
        Host: 8.8.8.8 (Google's DNS, burde være oppe 99.99% av gangene man prøver)
        Port: 53/tcp
        Service: domain (DNS/TCP)
        Dokumentasjon på biblioteket finnes her:
        https://docs.python.org/3/library/socket.html
        """
        try:
                socket.setdefaulttimeout(1)
                socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
                return True
        except Exception as ex:
                pass
        return False

    def writeToFile():

        """
        Selve kjerne metoden i RSS feeden, denne henter nyheter fra kilder
        i rsslinker listen, man kan legge til flere ved og legge de til i samme format.
        HUSK og bruk komma hvis du legger til nye nyhets kilder, den siste i listen skal
        ikke avsluttes med komma.
        Bruker feedparser og sys bibliotekene:
        https://pythonhosted.org/feedparser/
        https://docs.python.org/3/library/sys.html


        GJENSTÅR:
        Det som gjenstår er og formatere tidskodingen(post.published) i norsk format og uten +0100,
        se dokumentasjon til feedparser (kan hende man må lage en egen method for dette)
        Se på mulighetene for å filtrere ut gamle nyheter som er over 1 uke gammel, bruke time
        samt tidskodingen på post.published? Noen sånt....
        Se på muligheter for kunne legge til linker gjennom CLI, bare for læringen sin del, og kanskje
        til bruk andre steder i fremtiden...
        """

        rsslinker = {
        ('https://www.nrk.no/nyheter/siste.rss'),
        ('https://www.nrk.no/nordland/toppsaker.rssS')
        }

        feeds = []
        for url in rsslinker:
                feeds.append(feedparser.parse(url))

        orig_stdout = sys.stdout
        f=open("output.xml",'w')
        sys.stdout = f

        for feed in feeds:
                for post in feed.entries:
                        feed ="               "+post.published+" - "+post.title+": "+post.description+"\n"
                        print(feed)
        sys.stdout = orig_stdout
        f.close()


        # Print på linje 64 & 66 er for testing av internet_connected()
    if internet_connected():
        writeToFile()
        # print('Internet is up')
    else:
        # print('Internet is down')
        pass
