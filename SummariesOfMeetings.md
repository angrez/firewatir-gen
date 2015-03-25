# Summaries of Meetings #

## Nth meeting (05/16/2007) ##

### Accomplished ###

  * Angrez: appended list with supported FireWatir elements to the Timeline page.
  * Helder: wrote the blog post about the empty\_label.rb script.
  * Helder: dug into FireWatir code, collected some doubts and posted them along with some suggestions to the FireWatir mailing list.
  * Helder: learned some XPath.
  * Helder: learned the basics of parsing XML with REXML on voegol.xml.
  * Helder: recorded an example with TestGen4Web, looked into the XML outputed and translated it by hand into FireWatir code, getting an idea of how to make the process automatic.

### Decisions ###
  * Use REXML's SAX-like stream parsing (by filling out the sample streamlistener.rb).
  * Don't use full xpath from tg4w if we can help it. Make a search for the least restrictive xpath that returns a unique element. This may divorce us from being an official TestGen4Web translator. We'll have to see about this later.
  * Create a FireWatirGen module to include into generated .rb scripts for functionality that's not in FireWatir itself but has to be present in run-time rather than in translate-time (like element\_by\_least\_restrictive\_xpath() which depends on a running Firefox+FireWatir). If generally useful, some things from this module could later be incorporated into FireWatir itself.

### TODO (until next meeting) ###
  * Helder: fill out streamlistener.rb to parse the actions seen in the example voegol.xml. Use the absolute xpaths (later it's only a matter of changing the call from element\_by\_xpath to element\_by\_least\_restrictive\_xpath).
  * Helder: get the list of all possible actions outputed by TestGen4Web (try to find docs; if fail look into tg4w's code).
  * Helder: write the FireWatirGen module with element\_by\_least\_restrictive\_xpath.

### Long shots ###
  * Write a set of asserts covering all that FireWatir can do plus the stuff on the FireWatirGen module, like assert\_element\_by\_xpath(xpath) returns true if found and false otherwise. That'd be useful on its own, and we could also have a translator output a Test::Unit::TestCase.

## Third meeting (04/30/2007) ##

### Accomplished ###

  * Helder: Got the Gmail-label-emptying FireWatir script to work!
  * Angrez/Aaron: Searched for new recorders; didn't find any.

### Decisions ###

  * TestGen4Web is the final winner in the recorder contest.
  * We need a proof of concept working by the end of May.
  * Set Timeline page with milestones and project plan.

### TODO (until next week) ###

  * Helder: parse the XML from TestGen4Web (get the XML into a document tree that I can use).
  * Helder: start learning XPath.
  * Helder: write a blog post about the empty\_label.rb script.
  * Angrez: append list with elements supported by Firewatir to the Timeline page.
  * Aaron: have a great vacation! ;)

## Second meeting (04/23/2007) ##

### Accomplished ###

  * Helder: Tried playing around with Firewatir on Gmail to delete all messages with a label. Failed miserably. Learned a few things.
  * Helder: Installed DOM Inspector, WebDeveloper and InspectWidget extensions; started fussing around with pages structures.
  * Angrez/Aaron: Tried out TestGen4Web and looked at his output.
    * it doesn't write out reload command when user clicks on Back button;
    * it doesn't handle page pop ups. probably would have to record new script for new window and then merge it into the parent one;
    * don't know if it handles javascript popups (messages).

### Decisions ###

  * Ruled out selenium-ide as candidate for recorder.
  * Meetings should be weekly until the end of May (because of Helder's work and university classes), and then start to be twice a week as we build up speed.

### TODO ###

  * Helder: Write script to empty Gmail-**HTML** label (should be easier).
  * Helder: Go through roadmap in the application and sketch out Milestones.
  * Everyone: Search for new recorders. **Deadline** for picking one is _next week_.








