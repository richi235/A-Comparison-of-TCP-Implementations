<TeXmacs|1.99.5>

<style|<tuple|book|british|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Comparison of TCP
  Implementations>|<doc-subtitle|Linux TCP vs.
  lwIP>|<doc-author|<author-data|<author-name|Richard Sailer>>>|<\doc-misc>
    Universität Augsburg

    Lehrstuhl für Organic Computing

    Forschungsmodul im Studiengang Informatik

    \;

    \;

    \;

    \;

    \;

    Copyright <copyright> 2016 Richard Sailer

    Permission is granted to copy, distribute and/or modify this document
    under the terms of the <em|GNU Free Documentation License >(GFDL),\ 

    Version 1.3
  </doc-misc>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    1.1<space|2spc>Target Audience <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>

    1.2<space|2spc>Required Knowledge <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Related
    Work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    2.1<space|2spc>A Tale of Four Kernels
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>

    2.2<space|2spc>TCP/IP Illustrated Volume 2
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Feature
    Comparison and User Base> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    3.1<space|2spc>Feature Comparison <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    3.2<space|2spc>User Base <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>

    <with|par-left|1tab|3.2.1<space|2spc>Linux TCP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|3.2.2<space|2spc>LWIP TCP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>TCP
    Code Overview and Isolation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    4.1<space|2spc>Which Versions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>

    4.2<space|2spc>LWIP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>

    <with|par-left|1tab|4.2.1<space|2spc>C Source Files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|4.2.2<space|2spc>Header Files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    4.3<space|2spc>Linux TCP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>

    <with|par-left|1tab|4.3.1<space|2spc>C Source Files (Using Directory
    Structure and File Names) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|4.3.2<space|2spc>Header files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|4.3.3<space|2spc>Evaluation of Results and
    Methodology <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Code
    Quality Metrics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27><vspace|0.5fn>

    5.1<space|2spc>Why Code Quality? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>

    5.2<space|2spc>Static Code Analysis Tools Evaluation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>

    <with|par-left|1tab|5.2.1<space|2spc>Static Code Analysis Tools in
    General <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>>

    <with|par-left|1tab|5.2.2<space|2spc>Code Quality Metrics Tools
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    5.3<space|2spc>How we Obtained The Results
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>

    <with|par-left|1tab|5.3.1<space|2spc>Command Usage
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|1tab|5.3.2<space|2spc>About the Output Format
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    <with|par-left|1tab|5.3.3<space|2spc>Getting per Function Metrics
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    5.4<space|2spc>Results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>

    <with|par-left|1tab|5.4.1<space|2spc>Directory Structure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <with|par-left|1tab|5.4.2<space|2spc>File Lengths
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|2tab|5.4.2.1<space|2spc>LWIP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    <with|par-left|2tab|5.4.2.2<space|2spc>Linux TCP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1tab|5.4.3<space|2spc>Function Lengths
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>>

    <with|par-left|2tab|5.4.3.1<space|2spc>LWIP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>>

    <with|par-left|2tab|5.4.3.2<space|2spc>Linux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48>>

    <with|par-left|1tab|5.4.4<space|2spc>Cyclomatic Complexity (CC)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>>

    <with|par-left|2tab|5.4.4.1<space|2spc>LWIP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>>

    <with|par-left|2tab|5.4.4.2<space|2spc>Linux TCP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    <with|par-left|1tab|5.4.5<space|2spc>Comment Density
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|2tab|5.4.5.1<space|2spc>In Function Comments
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    <with|par-left|2tab|5.4.5.2<space|2spc>In Function Comments and Function
    Descriptions (All Comments) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>>

    5.5<space|2spc>A Short Qualitative Evaluation of the Header Files
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61>

    5.6<space|2spc>Lines of Code and Cyclomatic Complexity - A Correlation?
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>A
    short Discussion of Data Structures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63><vspace|0.5fn>

    6.1<space|2spc>The LWIP Packet Data Structure (PBUF)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-64>

    6.2<space|2spc>The Linux Packet Data Structure (SKB)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>

    6.3<space|2spc>Comparative Thoughts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-67>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-69><vspace|0.5fn>

    7.1<space|2spc>Ending Thoughts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    A<space|2spc>TCP SACK Functions in tcp_input.c>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-71><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix
    B<space|2spc>The Linux Socket Buffer Data Structure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-72><vspace|0.5fn>

    B.1<space|2spc>C Definition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-73>

    B.2<space|2spc>Struct Member Documentation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-74>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-75><vspace|0.5fn>

    <with|par-left|1tab|About the Sources Used in this Work
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-76>>
  </table-of-contents>

  <chapter|Introduction>

  TCP implementations share their fate with system administrators: they only
  get attention when something doesn't work. While shiny enterprise cloud web
  applications lie in the focus of most software manager and perhaps even
  developers TCP is the silent workhorse under every web application and
  every browser. Over 30 years of academic research and engineering effort
  are the reason for this network connection reliability people take for
  granted. Reliable and correct file downloads and web surfing have become
  naturally as well as electric power, water or german cars and
  trains<\footnote>
    Well the last two are perhaps no so good examples anymore.
  </footnote>.

  This \Pit works without having to spend one thought on it\Q property is in
  general a good thing, but nevertheless there will be cases when people are
  needed that understand TCP implementations. This can be when another
  extension to TCP is wanted or, well... something doesn't work. For these
  people this document is made. We give an overview over two TCP
  implementations and compare them. This does not include an function for
  function explanation, more a general picture and some code quality study.

  Depending on what you want to do perhaps not every part of the work is
  interesting for you, this why we took good care of putting everything in
  separate chapters and sub chapters. We have one sub chapter on TCP features
  comparing the two implementations feature wise. The next is on user bases
  telling how much and which people use these implementations.

  In our fourth chapter we start looking at the TCP implementations and their
  files, we describe and isolate the files from their surrounding network
  stack code to have and examine them separately in the next chapters.

  Subsequent we give an overview over different static code analysis and code
  quality metric measurement tools, since this is the second focus of this
  work. Besides getting an overview of TCP implementations and conceptually
  understanding them, we also want to try to quantitative measure and
  classify their implementation quality. During this we not only want to
  present the user our details but also explain the tools and how to \Pdo
  this at home\Q with other software or code. This includes a little overview
  over available tools and a short tutorial how we used them.

  In the next sub chapter we show the comparative results regarding project
  modularization, function length and complexity and density of code
  documentation.

  Then in chapter six we take a closer look at the data structures these two
  implementations use for packets and compare them, quantitatively and from
  an software architecture point of view.

  <section|Target Audience>

  In general this text can be helpful for the following categories of people:

  <\enumerate>
    <item>People interested in TCP implementations. What features are there?
    How are they structured? What is the code quality of existing
    implementations.

    <item>People interested in code quality metrics. How to create them? How
    to interpret and visualise them?

    <item>People who often have to dive into and understand a large existing
    code base. Since the methodology presented here for isolating parts and
    getting an overview is usable for every software project, not only TCP
    implementations.
  </enumerate>

  <section|Required Knowledge>

  This work is in general thought for graduate student's having a bachelor
  degree in computer science or related fields. But it should also be easy to
  understand for everyone having a few years of practical experience with
  computer networks and C. To be more precise the most relevant concrete
  necessary skills are:

  <\itemize>
    <item>Knowing the C programming language

    <item>Understanding TCP<\footnote>
      A very good and comprehensive description of TCP can be found in
      Tanenbaum's Computer Networks book<cite|tanenbaum2003computer>. For an
      short overview the wikipedia article on TCP
      (<hlink|https://en.wikipedia.org/wiki/Transmission_Control_Protocol|https://en.wikipedia.org/wiki/Transmission_Control_Protocol>)
      is also a good reference.
    </footnote>

    <item>Some familiarity with the Linux command line
  </itemize>

  <chapter|Related Work>

  <section|A Tale of Four Kernels>

  In 2008 Diomidis Spinellis released the paper \PA Tale of Four
  Kernels\Q<cite|Spi08b>. There he extensively compared the four operating
  systems:

  <\enumerate>
    <item>FreeBSD

    <item>GNU/Linux

    <item>OpenSolaris<\footnote>
      Oracle has bought Sun Microsystems meanwhile and discontinued the open
      development of OpenSolaris. Nevertheless there exists a free fork of
      OpenSolaris continued by some of its developers called OpenIndiana.
    </footnote>

    <item>The Windows Research Kernel<\footnote>
      The Windows Research Kernel is a cleaned up and reduced release of the
      Windows Server 2003 kernel. This means it's a 64 bit NT kernel.
      Microsoft released this as a step towards academica, to make it
      possible to use this NT code in Operating system lectures and curses.
      Nevertheless it's still not open source and obtaining the source code
      is a bit laborious, since it is only given to academic staff under
      certain conditions.
    </footnote>
  </enumerate>

  His comparison regards code quality metrics. His final result is that there
  are no big quality differences between the 4 systems, but Linux scores a
  bit bad in documentation, while windows scores bad in code structure and
  function length. Spinellis work has been a been a major inspiration for our
  research regarding concepts and methodology. We will even use one of his
  tools for collecting metrics <samp|cqmetrics>.

  <section|TCP/IP Illustrated Volume 2>

  In TCP/IP Illustrated Volume 2<cite|wright1995tcp> <name|Gary Wright> and
  <name|Richard Stevens> carefully describe and explain the TCP/IP
  implementation of 4.4BSDLite. The usual common TCP/IP reference
  implementation of their time<cite|wright1995tcp><cite|Stevens:1993:TIP>.
  This BSD TCP/IP implementation was the first complete and freely available
  TCP/IP implementation and was for long time referenced as \Pthe standard\Q.
  Even the Linux TCP source code references it's design and behaviour in many
  comments several times.<\footnote>
    See <verbatim|tcp.c> and <verbatim|tcp_input.c> for examples.
  </footnote>

  Unfortunately this work and the TCP/IP implementation is from 1995 and
  there exist no newer release. Since TCP/IP implementations have evolved
  this book is not so recent anymore. But it's still a good starting point,
  since the fundamental algorithms and concepts have rarely been changed. In
  most cases they were rather augmented.<\footnote>
    A look at the history of RFC standards and also the \ SVN revision
    history of the BSD releases is good conceptual proof for this.
  </footnote>

  The authors explain the data structures and logic in a very clear,
  understandable and visual way using many illustrations and careful source
  code discussion.

  Since describing and explaining TCP implementations is also a part of our
  work, in all the relevant places we tried to use a comparable presentation
  approach.

  \;

  <chapter|Feature Comparison and User Base>

  <section|Feature Comparison>

  Since TCP is over 30 years old<cite|isi_793rfc81> and widely used there
  exist lots of extensions. While the original TCP is already quite complex
  and powerful, all these extensions add even more functionality but also
  complexity.<\footnote>
    For brevity and conciseness we chose to omit a full description of every
    TCP extension. You can find a short and informal description of most of
    them on <hlink|https://en.wikipedia.org/wiki/Transmission_Control_Protocol|https://en.wikipedia.org/wiki/Transmission_Control_Protocol>
    and a detailed full description in their respective RFCs.
  </footnote> To understand and compare TCP implementations not only code
  discussion, but also a semantic look at the functionality is useful.
  Understanding the range of functionality also means understanding size and
  several design decisions.

  Table <reference|tcp-features> list the most common TCP features and
  extensions and if they're implemented by one of our TCP implementations. A
  x means \Pyes\Q, a - means \Pno\Q. Our primary sources were the Linux TCP
  man page<cite|man-tcp> and the official LWIP wiki<cite|lwip-doxygen>.

  <big-table|<tabular|<tformat|<table|<row|<cell|<block|<tformat|<cwith|7|7|1|1|cell-hyphen|n>|<table|<row|<cell|Feature>|<cell|In
  LWIP?>|<cell|In Linux TCP?>>|<row|<cell|Congestion
  Control>|<cell|x>|<cell|x>>|<row|<cell|Fast
  Retransmit>|<cell|x>|<cell|x>>|<row|<cell|Fast
  Recovery>|<cell|x>|<cell|x>>|<row|<cell|Fast
  Open>|<cell|->|<cell|x>>|<row|<cell|Delayed
  ACK>|<cell|->|<cell|x>>|<row|<\cell>
    Additional Pluggable Congestion Control Algorithms

    (Westwood, Vegas, NewReno, Cubic, etc.)
  </cell>|<cell|->|<cell|x>>|<row|<cell|Multithreading
  Support>|<cell|->|<cell|x>>|<row|<cell|Portable>|<cell|x>|<cell|->>|<row|<cell|Firewall
  Support>|<cell|->|<cell|x (netfilter, conntrack)>>|<row|<cell|Instrumentation>|<cell|->|<cell|x
  (ftrace, perf, etc.)>>|<row|<cell|Dynamic User Space
  Configuration>|<cell|->|<cell|x>>|<row|<cell|ECN>|<cell|->|<cell|x>>|<row|<cell|TCP
  Sack>|<cell|->|<cell|x>>|<row|<cell|TCP
  Fack>|<cell|->|<cell|x>>|<row|<cell|TCP
  RACK>|<cell|->|<cell|x>>|<row|<cell|TCP
  Keepalive>|<cell|x>|<cell|x>>|<row|<cell|PAWS (Protection Against Wrapping
  Sequence numbers)>|<cell|x>|<cell|x>>|<row|<cell|Window scaling (RFC
  1323)>|<cell|x>|<cell|x>>|<row|<cell|Timestamps>|<cell|x>|<cell|x>>|<row|<cell|Nagle
  Algorithms>|<cell|x>|<cell|x>>>>>>>>>>|<label|tcp-features>Feature
  Comparison of the Two TCP Implementations>

  What do these differences mean? Well several conclusions:

  <\enumerate>
    <item>TCP Sack/RACK/Fack

    TCP Sack is \PSelective Acknowledgements\Q a very powerful but also
    complex extension. Omitting it means considerable less code, but also
    less functionality. Omitting Sack means often re-sending more packets
    than necessary, because acknowledgements are less accurate. You can find
    a further discussion of the Linux TCP Sack functions in Appendix
    <reference|tcp-sack-appendix> and in the File Organisation Section of the
    Code Quality Results.

    The same effect on code length and functionality as with SACK also holds
    for RACK and Fack but in a less grave way.

    <item>Firewall Support

    Omitting firewall support also saves a lot of functionality and code
    complexity.

    <item>Multithreading Support

    The LWIP TCP implementation works entirely single threaded and uses a lot
    of global variables.<\footnote>
      Which you can see, for example in <verbatim|tcp_in.c> lines
      <verbatim|67-84>\ 
    </footnote> While using global variables in general is bad practise in a
    embedded, memory constrained, per design single threaded environment it's
    a understandable design decision.

    Working single threaded has the following advantages

    <\itemize>
      <item>No locking overhead (less code complexity)

      <item>No possible race condition, or starvation, or deadlock problems
    </itemize>

    And the following disadvantages:

    <\itemize>
      <item>Less throughput on multi core systems
    </itemize>

    Since the embedded systems LWIP targets are mostly single core system
    this makes sense.
  </enumerate>

  So summarised, LWIP implements considerable less functionality and so we
  expect the code to be smaller and less complex. The next chapters will show
  if this comes true.

  <section|User Base>

  How relevant is all this? Are we evaluating a academic curiosity or
  widespread productivity software? The next sections will answer these
  questions.

  <subsection|Linux TCP>

  The Linux TCP implementation is not very portable, it has only one target
  software system: the Linux kernel. Nevertheless the Linux kernel is really
  portable and widespread so this compensates. According to a hitlinks study
  the Linux kernel has one of the largest installation base of all general
  purpose systems<cite|linux-market-share>. The detailed reason for this are:

  <\itemize>
    <item>Android phones (65 % of all smartphones<cite|linux-market-share>)

    <item>Also most server run Linux

    <item>And a considerable share of network home routers, video game
    consoles and smartwatches
  </itemize>

  All these devices also run the Linux TCP implementations, which make it
  quite widespread and relevant.

  <subsection|LWIP TCP>

  LWIP is a lot more specialised (and portable), it's main use case are
  embedded devices and embedded operating systems. It's used by many embedded
  device manufacturers like:

  <\itemize>
    <item>Altera

    <item>Analog Devices<cite|sanghai2008building>

    <item>Xilinx<cite|velusamy2008lightweight>

    <item>Honeywell

    <item>and some more
  </itemize>

  Among other things in avionic and automotive systems.

  \;

  LwIP may also become even more widespread with the progress of the internet
  of things<\footnote>
    The \Pinternet of things\Q is the idea of connecting physical devices to
    the internet. Like cars, fridges, coffee maker, lights, rooms, doors etc.
    What this means for it users and if it makes sense is a separate
    question, not discussed in this document.
  </footnote>, since most of the involved devices are small and have limited
  resources. For them a lightweight TCP/IP stack is a seasonable
  infrastructure to connect to the internet.

  <chapter|TCP Code Overview and Isolation>

  Since both

  <\itemize>
    <item>the TCP implementation in the Linux kernel

    <item>and the TCP implementation inside the LWIP TCP/IP stack\ 
  </itemize>

  are part of a larger code base, at first we had to locate and isolate the
  source files which are the TCP implementation. The following subsections
  describe how we identified them and which particular files they are.\ 

  We describe our course of action quite detailed. This may be of use to you
  when you will have to identify and isolate some functionality in a bigger
  project some day, for reuse or some other purpose. On the other hand, if
  you're just interested in the results, you can find the isolated file lists
  at the end of each sub chapter.

  During the selection and isolation we also had to look at the files to
  isolate. So, as a side effect, this chapter also gives a good overview of
  the isolated files and their content/functionality.\ 

  The same goes for directory structure and file organisation. We looked
  through the whole project while searching and also explain what we found
  and how we used this to \Pnavigate and find\Q. So you can (to some degree)
  get an idea how these project files are organised and how to find stuff.

  Speaking of effort, the isolation was relatively straightforward for LWIP
  and a bit more complicated for Linux.

  <section|Which Versions>

  We decided to use recent stable versions<\footnote>
    Proof for correct Linux Version Number: <cite|linux-repo-cgit> This is
    the web interface to the version control system of the Linux source code
    repository. This special sites lists all refs, which are tags and branch
    pointers, Linux uses tags for version numbering. Version numbers of the
    form (for example) v3.x.y (three numbers) are stable releases. Stable
    release numbers are sorted lexicographically (Source for all of these
    statements about version numbers: <cite|love2010linux> ). So to find the
    most recent stable release, one has to pick the lexicographically highest
    stable version number in this list of tags. Which at the moment is
    4.8.14. A dump of this repository's web interface refs site of the
    current day is also attached to this document in the \Pweb-sources\Q
    folder.
  </footnote> \ <\footnote>
    Proof for correct LWIP Version Number: <cite|lwip-repo-cgit> This again,
    like in the proof for the Linux Version Number, is the web interface to
    the version control system of a source code repository's. But this time
    of course the LWIP source code repository's. Here also tags are used for
    version numbers. The highest version number you can find on this page is
    Release 2.0.0. A dump of this page is also included in the
    \Pweb-sources\Q folder.
  </footnote> of both TCP implementations which are at the time of this
  writing<\footnote>
    14.12.2016
  </footnote>:

  <big-table|<tabular|<tformat|<table|<row|<cell|<block|<tformat|<table|<row|<cell|TCP
  Stack>|<cell|Version>>|<row|<cell|Linux Kernel
  TCP>|<cell|4.8.14>>|<row|<cell|LWIP TCP>|<cell|Release
  2.0.0>>>>>>>>>>|Software Versions Used for Analysis>

  <section|LWIP>

  Our first approach was to use the directory structure and filenames. The
  LWIP repository contains a directory called <verbatim|src/> containing all
  source code and header files. In <verbatim|src/> there resides a text file
  <verbatim|FILES> containing the following information:

  <\verbatim>
    \;

    api/ \ \ \ \ \ - The code for the high-level wrapper API. Not needed if

    \ \ \ \ \ \ \ \ \ \ \ \ you use the lowel-level call-back/raw API.

    \;

    apps/ \ \ \ \ - Higher layer applications that are specifically
    programmed

    \ \ \ \ \ \ \ \ \ \ \ \ with the lwIP low-level raw API.

    \;

    core/ \ \ \ \ - The core of the TPC/IP stack; protocol implementations,

    \ \ \ \ \ \ \ \ \ \ \ \ memory and buffer management, and the low-level
    raw API.

    \;

    include/ \ - lwIP include files.

    \;

    netif/ \ \ \ - Generic network interface device drivers are kept here.

    \;

    For more information on the various subdirectories, check the FILES

    file in each directory.
  </verbatim>

  \;

  <subsection|C Source Files><label|lwip-dir>

  Obviously <verbatim|api/, apps/ and netif/> and <verbatim|netif/> aren't
  relevant if we are looking for the TCP implementation. We also won't
  consider <verbatim|include/> here, because header files will be treated
  extra later. So the directory relevant for us is <verbatim|core/>.
  <verbatim|core/> contains the following files:

  <\verbatim>
    \ \<gtr\> tree -L 1

    .

    \<#251C\>\<#2500\>\<#2500\> def.c

    \<#251C\>\<#2500\>\<#2500\> dns.c

    \<#251C\>\<#2500\>\<#2500\> inet_chksum.c

    \<#251C\>\<#2500\>\<#2500\> init.c

    \<#251C\>\<#2500\>\<#2500\> ip.c

    \<#251C\>\<#2500\>\<#2500\> <strong|ipv4>

    \<#251C\>\<#2500\>\<#2500\> <strong|ipv6>

    \<#251C\>\<#2500\>\<#2500\> mem.c

    \<#251C\>\<#2500\>\<#2500\> memp.c

    \<#251C\>\<#2500\>\<#2500\> netif.c

    \<#251C\>\<#2500\>\<#2500\> pbuf.c

    \<#251C\>\<#2500\>\<#2500\> raw.c

    \<#251C\>\<#2500\>\<#2500\> stats.c

    \<#251C\>\<#2500\>\<#2500\> sys.c

    \<#251C\>\<#2500\>\<#2500\> tcp.c

    \<#251C\>\<#2500\>\<#2500\> tcp_in.c

    \<#251C\>\<#2500\>\<#2500\> tcp_out.c

    \<#251C\>\<#2500\>\<#2500\> timeouts.c

    \<#2514\>\<#2500\>\<#2500\> udp.c
  </verbatim>

  (with the <strong|strong> printed ones being directories). Here there lie
  three files, <verbatim|tcp.c, tcp_in.c, tcp_out.c> their naming strongly
  suggests they contain a tcp implementation. And the naming of all the other
  files suggest they contain something else than tcp. (The subfolders
  <strong|ipv4> and <strong|ipv6> contain nothing by filename tcp-related
  either. Their full content was not displayed for brevity).

  But what if the modularization is not that clean? What if <verbatim|pbuf.c>
  or <verbatim|ip.c> also contains some TCP logic? Just assuming the
  separation is clean would mean a lot of good faith and not very much
  critical scientific spirit. This is why we looked for a second method to
  get or verify the the selection of these three files. And we found one!

  Fortunately the build process of LWIP is highly customisable. It's even
  possible not to include TCP in the final build at all<cite|lwip-doxygen>
  (like, for embedded devices which only need UDP). So we could look at how
  this in/exclusion works and which files where affected.

  The build process configuration works via a optionally user-provided file
  called <verbatim|lwipopts.h>. Here it is possible to disable TCP via the
  following line:<cite|lwip-wiki-lwipopts.h>

  <\verbatim>
    <\code>
      \ #define LWIP_TCP 0
    </code>
  </verbatim>

  This all uses the C preprocessor. It's a technique called <em|conditional
  compilation> <cite|c-prog-lang>, which means, several other files contain
  the structure surrounding code:\ 

  \;

  <\big-figure>
    <\verbatim>
      #if LWIP_TCP <with|color|blue|/* don't build if not configured for use
      in lwipopts.h */>

      ...

      #endif <with|color|blue|/* LWIP_TCP */>
    </verbatim>
  </big-figure|Conditional Compilation Example>

  \;

  This means only if the preprocessor Symbol <verbatim|LWIP_TCP> is true
  (defined and not null) the code between #if and #endif will be included in
  the final build.

  So we can look which and how much code in the LWIP repository is surrounded
  by this structure and therefore deduce which files belong to the TCP
  implementation. This is great because that's not that difficult using some
  regex magic. To search all files in <verbatim|src/core/> we used the tool
  <verbatim|ag> which is like grep, but faster and with nicer formatted
  output.<\footnote>
    See <hlink|https://github.com/ggreer/the_silver_searcher|https://github.com/ggreer/the_silver_searcher>
    if interested. It's packaged and available in at least: Ubuntu, Arch
    Linux and Debian.\ 
  </footnote>:

  \;

  <\big-figure>
    <\verbatim>
      \ ag -i \ <with|color|blue|'#if.*LWIP_TCP[\\s\\S]*#endif.*LWIP_TCP.*'>\ 

      \ \ \<gtr\> /tmp/LWIP_TCP_macro_scanning\ 
    </verbatim>
  </big-figure|Ag Command Used to Search for Uses of This Special Conditional
  Compilation Structure>

  \;

  This searches for all text being enclosed by the previously described
  structure and saves the results in the file
  <verbatim|/tmp/LWIP_TCP_macro_scanning><\footnote>
    Also included in the attached dir/archive under the same name
  </footnote>. Some explanations about <verbatim|ag> and the regexp:

  <\itemize>
    <item>ag searches multi-line per default so it is possible to match
    bigger sections enclosed by the structure

    <item><verbatim|.*> means 0 or more arbitrary symbols but no newline

    <item><verbatim|[\\s\\S]> is Perl regex specific and means:\ 

    <\description>
      <item*|<verbatim|\\s>>all whitespaces

      <item*|<verbatim|\\S>>everything except whitespaces
    </description>

    So together <verbatim|[\\s\\S]> means \Pabsolutely every symbol\Q

    <item>why <verbatim|-i> (case insensitive)? Well, we were not sure if the
    preprocessor keywords are case sensitive. However, the results showed
    that we didn't match \Ptoo much\Q because of lower/higher-case
    variations.

    <item>The result file contains <strong|all> matches, including the lines
    between the structure, which is why it's quite long and not directly
    included in this work. But it's easy too navigate and orientate in it
    since ag draws the corresponding filename and line number in front of
    every line. This makes it also easy to tell apart the different matches.
  </itemize>

  The result of this pattern matching journey was very pleasant. The files in
  <verbatim|src/core/> containing the <verbatim|LWIP_TCP> structure, can be
  divided into two categories:

  <\enumerate>
    <item>Files containing one or more matching blocks of only a few lines
    length.\ 

    Like <verbatim|timeouts.c> and <verbatim|init.c>. These are files
    fulfilling other tasks than TCP, but having little TCP related parts.\ 

    Like the general timer in timeouts.c which can also be asked if \Pis the
    tcp timer currently scheduled\Q an needs some code to be in sync with the
    TCP timer.\ 

    Or the code in <verbatim|init.c> initialising the TCP stack at start
    time.

    <item>Files being almost the entire matching block (minus some copyright
    header).

    These are our candidates. Fortunately these match with the 3 files
    discovered by name and directory structure earlier which means: LWIP has
    a clear and clean module distinction. This can also be seen as a first
    result metric!
  </enumerate>

  So now we know the .c files containing the TCP implementation for sure and
  have learned some facts about the LWIP directory structure, the other files
  in <verbatim|src/core/> and how they relate to the TCP implementation. To
  complete this little section here is a synopsis of these 3 files with a
  short description taken from their comment header:\ 

  <\description-long>
    <item*|tcp.c>Common functions for the TCP implementation, such as
    functions for manipulating the data structures and the TCP timer
    functions.

    <item*|tcp_in.c>The input processing functions of the TCP layer.

    <item*|tcp_out.c>The output functions of TCP.
  </description-long>

  <subsection|Header Files>(in <verbatim|src/include/lwip/>)

  Unfortunately the pattern matching approach didn't work that well for the
  header files. Well, it worked for 2 of 3 files. We could find
  <verbatim|tcp.h> and <verbatim|priv/tcp_priv.h> with this method. But
  further code reading in a later stage of this work revealed, that one of
  this file includes a further header file: <verbatim|prot/tcp.h>.

  Of course this somehow makes sense, if you want to ensure that a unneeded
  header files is not included you do not need to \Pblock\Q it directly, it
  suffices if all files including it are blocked. Fortunately .c files do not
  get included this way so this does not apply to .c files, therefore we
  don't have to go back and correct this for the .c files.

  At last again, a listing and short description of all the files we took
  into account:

  <\description-long>
    <item*|tcp.h>TCP API. The function calls with which the TCP
    implementation can be accessed from the \Poutside\Q. Included by the
    tcp*.c files because they also have to know the API they have to fulfil.

    <item*|priv/tcp_priv.h>TCP internal implementations (do not use in
    application code). Private as in \Pnot for the LWIP applications like the
    little web server or the TFTP server.

    <item*|prot/tcp.h>TCP protocol definitions, like TCP header and flags.
  </description-long>

  <section|Linux TCP>

  For the Linux TCP implementation this was more difficult.\ 

  <subsection|C Source Files (Using Directory Structure and File
  Names)><label|linux-dir>

  Again at First we decided to use the directory structure and filenames. In
  the Linux root folder there lies a folder called <verbatim|net/>. In this
  folder we first looked for all files containing \P<verbatim|tcp>\Q in their
  filename and ending with <verbatim|.c>. We did this via:

  <\code>
    find . -iname '*tcp*.c' \<gtr\> /tmp/linux-filenames-containing-tcp
  </code>

  With the following result:

  <\with|par-columns|2>
    <\verbatim>
      ./rds/tcp.c

      ./rds/tcp_recv.c

      ./rds/tcp_listen.c

      ./rds/tcp_send.c

      ./rds/tcp_connect.c

      ./rds/tcp_stats.c

      ./ipv4/tcp_htcp.c

      ./ipv4/tcp.c

      ./ipv4/tcp_pr.c

      ./ipv4/tcp_highspeed.c

      ./ipv4/tcp_nv.c

      ./ipv4/tcp_metrics.c

      ./ipv4/tcp_vegas.c

      ./ipv4/tcp_probe.c

      ./ipv4/tcp_cong.c

      ./ipv4/tcp_westwood.c

      ./ipv4/tcp_cubic.c

      ./ipv4/tcp_output.c

      ./ipv4/tcp_recovery.c

      ./ipv4/tcp_yeah.c

      ./ipv4/tcp_dctcp.c

      ./ipv4/tcp_offload.c

      ./ipv4/tcp_cdg.c

      ./ipv4/tcp_lp.c

      ./ipv4/tcp_bic.c

      ./ipv4/tcp_timer.c

      ./ipv4/tcp_fastopen.c

      ./ipv4/tcp_diag.c

      ./ipv4/tcp_veno.c

      ./ipv4/tcp_hybla.c

      ./ipv4/tcp_input.c

      ./ipv4/tcp_scalable.c

      ./ipv4/tcp_ipv4.c

      ./ipv4/tcp_illinois.c

      ./ipv4/tcp_minisocks.c

      ./ipv6/tcpv6_offload.c

      ./ipv6/tcp_ipv6.c

      ./netfilter/xt_tcpmss.c

      ./netfilter/nf_nat_proto_tcp.c

      ./netfilter/ipvs/ip_vs_proto_tcp.c

      ./netfilter/xt_tcpudp.c

      ./netfilter/xt_TCPOPTSTRIP.c

      ./netfilter/xt_TCPMSS.c

      ./netfilter/nf_conntrack_[..]_tcp.c
    </verbatim>
  </with>

  Looking at this list we can eliminate several entries via a process of
  elimination:

  <\enumerate>
    <item>In <verbatim|netfilter/> lies the packet filter implementation.
    (Iptables and firewalling functionality)

    Therefore the listed files in the netfilter folder should be related to
    \Pmatching tcp packets\Q but not be the TCP implementation, therefore we
    can omit them.

    <item>The files in <verbatim|ipv6/>:

    <verbatim|./ipv6/tcp_ipv6.c> contains the glue code to make tcp work in
    IPv6 packets. Therefore it's not relevant for us. (Source: The Header in
    the file)

    <verbatim|./ipv6/tcpv6_offload.c> contains TCP offloading code.
    Offloading means \Pletting specialised hardware do stuff, that usually
    the CPU does\Q. Offloading is a good and very performance-conducive
    thing, but also something not directly related to a TCP implementation.
    Therefore we can ignore this file too.

    <item>The files in <verbatim|rds/>:

    Those were the biggest surprise. A short look at the file
    <verbatim|rds/Kconfig> (see Note <reference|kconfig-def>, for details
    about Kconfig files) revealed what <verbatim|rds/> is at all:\ 

    <\verbatim>
      <\quote-env>
        <verbatim|>config RDS

        \ \ tristate "The RDS Protocol"

        \ \ depends on INET

        \ \ ---help---

        \ \ \ The RDS (Reliable Datagram Sockets) protocol provides \ \ 

        \ \ \ reliable, sequenced delivery of datagrams over Infiniband or
        \ \ \ TCP.
      </quote-env>
    </verbatim>

    So RDS is a own network protocol somehow using TCP (or Infiniband) for
    its functionality. We can therefore safely assume that all the files like
    <verbatim|./rds/tcp_connect.c> contain the glue code to make RDS work
    <em|using TCP> but no TCP implementation critical files. Therefore we can
    omit them too.
  </enumerate>

  <\note>
    <label|kconfig-def><verbatim|Kconfig> files and <verbatim|make
    menuconfig>

    Kconfig files are the info files used by the kernel configuration tools
    (like make menuconfig or make nconfig). These tools allow you to select
    which functionality you want to include in your kernel and which to omit.
    Somehow a more sophisticate way of doing conditional compilation, like
    with LWIP in the last sub chapter. Those tools use the Kconfig files in
    the subdirectories to know and display all the available functionality
    modules, with a short description, this description helped us here.
  </note>

  \;

  This elimination now leaves us with the files in <verbatim|ipv4/>, which
  are still quite a lot. Some filenames look suspicious like
  <verbatim|tcp_yeah.c> or <verbatim|tcp_vegas.c>. Both sound suspiciously
  related to congestion control algorithms (like YEt Another Highspeed
  TCP<cite|baiocchi2007yeah> and Vegas<cite|brakmo1994tcp>). A short look at
  their content and the headers confirms this suspicion. Actually a lot of
  these files sounded like additional congestion control algorithms. We
  decided not to include them in our analysis for several reasons:

  <\enumerate>
    <item>They're often contributed from external research projects, so their
    quality may vary a lot from the rest of the core-TCP implementation (in a
    good way as well as in a bad way). So they should be analysed separately.

    <item>The Linux default is TCP Cubic. Also most widespread distributions
    use Cubic for default too<\footnote>
      See the <verbatim|/boot/config-$kernel_version> file on a arbitrary
      Ubuntu, Debian or Fedora system.
    </footnote>(Although at least Ubuntu and Debian include them as modules
    in <verbatim|/lib/modules/$kernel-version/>). Therefore we currently
    assume they are not that widely used. This is an assumption and may be
    not true, so neither less it was just a focus decision to only include
    Core-TCP.
  </enumerate>

  So how do we isolate them from the Core-TCP implementation? We decided to
  use conditional compilation and the kernel config feature again.
  Fortunately in the semi-graphical kernel configuration utility
  <verbatim|make nconfig> you can select or deselect every TCP congestion
  control algorithm (or chose compilation as a module). Therefore we created
  a new kernel config, being the default Debian one but having the option
  <verbatim|"TCP: advanced congestion control">
  (<verbatim|CONFIG_TCP_CONG_ADVANCED>) disabled, to get the absolute basic
  and no extra congestion control algorithms<\footnote>
    The full config lies in the attached archive in the folder
    <verbatim|linux-compilation-no-advanced-tcp-cc>.\ 
  </footnote>. At next we compiled the kernel (or at least all configured
  files in <verbatim|net/ipv4>) using

  <\verbatim>
    make clean

    make net/ipv4
  </verbatim>

  A whole terminal log of the commands and the compile output is attached in
  the <verbatim|linux-compilation-no-advanced-tcp-cc> folder. The relevant
  findings can be obtained when we grep the compile log for \Ptcp\Q which
  results in:

  <\code>
    \<gtr\> grep "tcp" compile-log

    \ \ CC \ \ \ \ \ net/ipv4/tcp.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_input.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_output.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_timer.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_ipv4.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_minisocks.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_cong.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_metrics.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_fastopen.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_recovery.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_offload.o

    \ \ CC \ \ \ \ \ net/ipv4/tcp_cubic.o

    \ \ CC [M] \ net/ipv4/tcp_diag.o
  </code>

  This list is way more handy and clear than the last one. But this could
  still contain \Ptoo much\Q i.e. files containing something else than the
  core TCP implementation. Too be more sure these are the correct files (and
  to get a first semantic overview over the Linux TCP implementation) lets
  start with a short description of each file, together with <strong|[yes]>
  if we decided to include it in our analysis and <strong|[no]> if we decided
  against it:

  <\description-long>
    <item*|tcp.c>TCP implementation all common \Pbase\Q functions

    <strong|[yes]>

    <item*|tcp_input.c>All functions for processing incoming TCP segments.

    <strong|[yes]>

    <item*|tcp_output.c>All functions for processing outgoing TCP packets.

    <strong|[yes]>

    <item*|tcp_timer.c>All TCP related timers which include:

    <\description>
      <item*|tcp_write_timer>The default TCP retransmission timeout.
      Re-transmits a packet if no ACK has arrived in time

      <item*|tcp_delack_timer>The delayed ACK timer. This makes it possible
      to avoid sending an ACK for every packet (which is expensive). Using
      this timer it's possible to \Pwait a little time\Q before sending an
      ACK. Maybe an additional data packet arrives and we can send an ACK for
      2 packets, which is way more efficient. See RFC
      2581<cite|allman.paxson.stevens_2581rfc99> for more details on delayed
      ACK.

      <item*|tcp_keepalive_timer>Used for the TCP keepalive feature, see
      TCP/IP Illustrated Vol 1<cite|Stevens:1993:TIP> for details.
    </description>

    <space|1em><strong|[yes]>

    <item*|tcp_ipv4.c>Functions necessary to make TCP work with IPv4. IPv4
    specific functions. Since binding to IPv4 is not really part of a
    core-TCP functionality we decided not to include it.

    <strong|[no]>

    <item*|tcp_minisocks.c>We are not entirely sure what this file does.
    Currently we assume it does something related to glueing TCP and the
    Socket layer together, also it's not very long, therefore we decided to
    keep it.

    <strong|[yes]>

    <item*|tcp_cong.c>TCP congestion control. This contains the main
    interface for concrete congestion control algorithm implementations, as
    well as a fallback implementation (New Reno)

    <strong|[yes]>

    <item*|tcp_metrics.c>Seems to generate and maintain connection and data
    flow metrics (like these read out by the <verbatim|netstat> tool). Since
    we could not decide whether these metrics are needed by the TCP Stack for
    normal operation or not we decided to keep them.

    <strong|[yes]>

    <item*|tcp_fastopen.c>The Fast Open algorithm as specified in
    <cite|RFC7413>. Since Fast Open is turned on by default since Kernel 3.13
    we decided to include it too

    <strong|[yes]>

    <item*|tcp_recovery.c>Implementation of another TCP extension: \PRACK: a
    time-based fast loss detection algorithm for TCP\Q. We decided to include
    it in our analysis. It's also very short (2 functions).

    <strong|[yes]>

    <item*|tcp_offload.c>Offload functionality for Linux TCP. Since
    offloading is no part of core-TCP functionality, we decided to exclude
    this file.

    <strong|[no]>

    <item*|tcp_cubic.c>The cubic TCP congestion control algorithm. Since it's
    the Linux default we decided to include it.

    <strong|[yes]>

    <item*|tcp_diag.c>Module for monitoring TCP transport protocols sockets.
    Since diagnostics are not needed for TCP operation we decided to exclude
    this file too.

    <strong|[no]>
  </description-long>

  So our final analysis set of .c files is:

  <\big-figure>
    <\code>
      tcp.c\ 

      tcp_cong.c\ 

      tcp_fastopen.c\ 

      tcp_input.c\ 

      tcp_metrics.c\ 

      tcp_minisocks.c\ 

      tcp_output.c\ 

      tcp_recovery.c\ 

      tcp_timer.c\ 
    </code>
  </big-figure|Final Analysis set of Linux TCP Implementation>

  <subsection|Header files>

  The relevant TCP header files are: (relatively to the repository root
  directory)

  <\big-figure>
    <\code>
      include/net/tcp_states.h

      include/net/tcp.h

      include/linux/tcp.h

      <verbatim|include/uapi/linux/tcp.h>
    </code>
  </big-figure|Linux TCP Header Files>

  These were obtained using the following methods:

  <\enumerate>
    <item>Using find, filenames, directory structure and file
    contents/comments like in the previous section

    <item>Looking at the header files included in all the .c files of the
    previous section.
  </enumerate>

  <subsection|Evaluation of Results and Methodology>

  Have we reached our goal? Have we isolated all relevant files. Could we
  have missed some? Could we have included too much? It's necessary and
  sensible too ask this because the method used here (for the Linux kernel)
  relies on several conditions and we have to be aware of that:

  <\enumerate>
    <item>The Linux kernel uses proper modularization and functionality is
    cleanly separated.

    <item>The Linux kernel source files are named sensible
  </enumerate>

  We want to give these points a short discussion:

  <\description>
    <item*|About modularization>Two recent books about Linux kernel
    programming contain the statement \Pthe Linux kernel is properly
    organised and modularised and you should look for your code too be be as
    good modularised to get in merged\Q <cite|love2010linux><cite|quade2012linux>.
    We have chosen to believe this.

    <item*|About naming>Especially this point is worry-some, since you may
    already have noticed from the logs and search results that kernel
    developers love abbreviations and short-naming things. Fortunately TCP is
    already quite short (3 characters), and for all function names and
    variables we have observed so far it was \Pnon-abbreviated\Q i.c.
    <verbatim|tcp_>. So we can assume this, at least for TCP with some
    certainty.
  </description>

  Both of these thoughts are quite but not finally convincing. Luckily there
  are other good reasons for our selection to be correct:

  <\enumerate>
    <item>The two books \PLinux Kernel Networking: Implementation and
    Theory\Q<cite|rosen2013linux> and \PTCP/IP Architecture, design and
    implementation in Linux\Q<cite|seth2009tcp> both contain discussions of
    the Linux TCP source code. All the files mentioned there are part of our
    analysis set. So this is a strong indication we have not forgotten
    anything.

    <item> The contents of the files (and their header comment) also seem to
    include a TCP implementation according to <cite|isi_793rfc81>. It didn't
    really look like we included anything to much. This discussion was the
    reason why we included a short description of every file.
  </enumerate>

  To summarise we have no formal proof our analysis set is correct, but all
  empirically measured results and literature comparison strongly suggests
  it. We also did not find any indication contradicting the selection. So we
  decided that the given proof provided enough certainty to move and use this
  analysis set.

  \;

  \;

  <chapter|Code Quality Metrics>

  <section|Why Code Quality?>

  Why do we look at code quality metrics? Why do we care for code quality?
  You could object that this is all wasted time and purely academic. Well it
  isn't there exist several arguments and evidence for paying attention to
  code quality.\ 

  <\enumerate>
    <item>Teamwork\ 

    Well structured and understandable code makes it much easier for a new
    colleague or open source project to join and be productive.

    <item>Security\ 

    While there is no hard evidence for it, there is a lot of evidence
    suggesting that many critical security vulnerabilities would never have
    grown in clean code. One of the best and most recent examples for this is
    the heart bleed bug of <name|OpenSSL> which grew in a very unclean
    code.<cite|Kamp:2014:PPO:2602649.2602816>

    <item>Software Maintenance Cost (Bug Fixing and Adding of New Features)

    Sun once did an internal study of their software project costs and coding
    conventions. They found the following results<cite|java-conventions>:

    <\itemize>
      <item>40%\U80% of the lifetime cost of a piece of software goes to
      maintenance

      <item>Hardly any software is maintained for its whole life by the
      original author.

      <item>Code conventions improve the readability of the software,
      allowing engineers to understand new code more quickly and thoroughly.
    </itemize>

    Robert Glass notes similar results<cite|glass2002facts>.
  </enumerate>

  Code quality is a complex issue with lots of facets. In this work we
  primarily look at:

  <\itemize>
    <item>Code organisation (How long are the files, how good is
    functionality modularised)\ 

    <item>Function length and Complexity (LOC and cyclomatic complexity)

    <item>Comment density (Function descriptions as well as comments in
    functions)
  </itemize>

  \;

  <section|Static Code Analysis Tools Evaluation>

  <subsection|Static Code Analysis Tools in General>

  When we looked for static code analysis tools wikipedia occurred as a good
  starting point to get a overview<\footnote>
    <hlink|https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis|https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis>
  </footnote>. The wikipedia list of tools for static code analysis contained
  over 24 different tools. After looking closer or trying out many of them we
  would suggest to roughly group them into the 3 groups displayed in figure
  <reference|static-analysis-tools>.

  \;

  <\big-figure>
    <tree|Static Analysis|Error Checking(Linting)|Formal Verification|Quality
    Metrics>
  </big-figure|<label|static-analysis-tools>The three Categories of Static
  Analysis Tools>

  Which are:

  <\description-long>
    <item*|Error Checking(Linting)>These tools check the code for potential
    errors and potential causes for trouble, way stricter than a compiler.
    These are infos like:

    <\itemize>
      <item>Value stored to `x' is never read

      <item>The right operand of `!=' is a garbage value

      <item>Potential leak of memory pointed to by `x'

      <item>Function call argument is an uninitialised value

      <item>Use of memory after it is freed
    </itemize>

    Examples for tools like this are:

    <\itemize>
      <item>clang analyser

      <item>splint

      <item>sparse

      <item>cppdepend
    </itemize>

    <item*|Formal Verification>These tools make it possible to prove the
    correctness of a program regarding a specification. Which means, they
    prove that the program really does x under given well defined input and
    circumstances. The problem with these tools is that you have to know and
    specify exactly what the program should do, and what these preconditions
    are. They also require additional work and code annotations in many
    cases. Example of such tools are:

    <\itemize>
      <item>Frama-C

      <item>PolySpace

      <item>Eclair

      <item>related: Isabelle
    </itemize>

    <item*|Code Quality Metrics>These tools generated quantitative data
    regarding the code quality. These include metrics like:

    <\itemize>
      <item>Comment density

      <item>Cyclomatic Complexity

      <item>Lines of Code per Function

      <item>Halstead Complexity
    </itemize>

    Examples are:

    <\itemize>
      <item>cccc<\footnote>
        <hlink|http://cccc.sourceforge.net/|http://cccc.sourceforge.net/>
      </footnote>

      <item>The method used by in \PA Tale of Four Kernels\Q<cite|Spi08b>

      <item>cmetrics<\footnote>
        <hlink|https://github.com/MetricsGrimoire/CMetrics|https://github.com/MetricsGrimoire/CMetrics>
      </footnote>

      <item>cqmetrics<\footnote>
        <hlink|https://github.com/dspinellis/cqmetrics|https://github.com/dspinellis/cqmetrics>
      </footnote>
    </itemize>
  </description-long>

  Please note that this grouping is rough and incomplete.We only noted a few
  examples for each category and some of the tools noted here fit into
  several categories. There also existed more more fine grained categories
  depending on how close you want to look these tools.

  Since we had decided to compare code quality of implementations only tools
  of the last category were relevant for us.

  <subsection|Code Quality Metrics Tools>

  Our next step was to test and compare the different available tools. Our
  experiences were:

  <\description-long>
    <item*|cccc>CCCC - a code counter for C and C++ was easily to obtain
    since it's packaged in most major GNU/Linux distributions. It also
    generates nice HTML pages. But it failed to recognise many function in
    the Linux kernels and did not display them in the result HTML pages. It
    also reported a lot of parse errors. Additionally the data was difficult
    to extract to generate further statistics therefore we decided not to use
    cccc.

    <item*|\PA Tale of Four Kernels\Q Method>The method used by Diomidis
    Spinellis in his paper heavily relies on his tool cscout. While it
    produced good result from its description, we got the impression it is
    also quite laborious and needs background knowledge on the cscout tool.
    Additionally it seemed to need several additional bash and Perl scripts
    as glue and a SQL database to setup. All this may pay for examination for
    a very large code base but for our small scope we decided against it.

    <item*|cmetrics>Cmetrics is a small tool set consisting of C and shell
    scripts. While the result output looked promising, it could not parse
    many functions of Linux tcp therefore we decided not to use it.

    <item*|cqmetrics>cqmetrics is a C++ tool written by the author of the \PA
    Tale of Four Kernels\Q paper. After self compilation it quickly generated
    statistics in the way we wanted them. Unfortunately cqmetrics only
    generates full per-file metrics but not per function. This makes it
    difficult to get a differentiated picture of the deviation or to reason
    about single functions.
  </description-long>

  In the end we chose cqmetrics and also constructed a way to get per
  function metrics. Which is described in the next section.

  <section|How we Obtained The Results>

  <subsection|Command Usage>

  After building cqmetrics its usage is quite simple:

  \;

  <shell|cat tcp.c \| qmcalc \<gtr\> qmcalc_results.tsv>

  \;

  The result is a file of tab separated values, which by itself are quite
  difficult to interpret. Fortunately the repository contains a header line
  which can be prepended using:

  \;

  <shell| cat header.tab qmcalc_results.tsv \<gtr\>
  qmcalc_results_+_header.tsv>

  \;

  Now we see the semantics of the results including:

  <\itemize>
    <item>cyclomatic complexity

    <item>Function Length

    <item>Usage of preprocessor directives

    <item>and many more
  </itemize>

  For a detailed listing of the output metrics see the <verbatim|README.md>
  file in the cqmetrics repository.

  <subsection|About the Output Format>

  .tsv is quite a low level format, the results looked like the following
  (abbreviated)

  \;

  <\verbatim>
    \ nchar \ \ nline \ \ line_length_min line_length_mean \ \ \ 

    188562 \ \ 5526 \ \ \ 0 \ \ \ \ \ 33.1227 29 \ \ \ \ \ \ 
  </verbatim>

  \;

  The lines are displaced because one tab character not always has the same
  length as the description word in the header.\ 

  Fortunately we found a good tool to comfortably work with this data.
  gnumeric can directly open these files via <shell|gnumeric
  qmcalc_results+header.tsv> and comfortably allows working with them or
  generating more sophisticated statistics.

  <subsection|Getting per Function Metrics>

  With the file format handled there remains only one last problem, how do we
  get per function metrics to get a differentiated picture of the deviation
  or to reason about single functions. To accomplish this we wrote a little
  Perl script which breaks a .c file apart into all single functions using a
  regular. Although in theory C grammar is not parse-able with regular
  expression in our case this worked trouble-free. Perhaps because both
  project adhere to a clear code style regarding opening and closing braces
  in the first column.\ 

  This functions are then fed separately into qmcalc. The qmcalc output is
  then (with the function an the file name) appended to our result file. So
  qmcalc is invoked for every function, but this was not really a performance
  problem, even for Linux TCP with its 409 functions this ran in under 2
  seconds. This Perl script also adds the header to the final result.

  The command to ran qmcalc with this Perl wrapper was:

  \;

  <shell|qcmetrics_wrapper.pl tcp.c \<gtr\> results_+_header.tsv>

  \;

  The full Perl script can be found in the accompanying data in the folder
  <verbatim|cqmetrics_wrapper/>\ 

  Our final result tsv file contained a slightly modified header and much
  more lines, one line for every function. The result files lie in
  <verbatim|tcp_implementations/$implementation/results/> this folder also
  contains the later unused results generated with <verbatim|cccc> and
  <verbatim|cmetrics>. These result files were the starting point for our
  further analysis and interpretation, covered in the next section.

  <section|Results>

  <subsection|Directory Structure>

  The point of a good directory structure is is to semantically group things
  together, to make finding and orientation in a big project easier. This is
  helpful for new colleagues or programmers, but even for experienced
  programmers if they move to another sub domain in a big project.
  Directories are one kind of modularity in C projects, besides compilation
  units.<cite|Spi08b>

  As you may remember from from searching the LWIP TCP Code in section
  <reference|lwip-dir> the LWIP directory structure was clear and well
  arranged. The functionalities where well grouped and code could be found
  fast and straightforward. Many Folders contained a text file FILES giving
  more info about the files in this directory. This all may be a side effect
  of LWIP being quite small in general but nevertheless LWIP made a good
  impression here.

  We can't say the same for Linux<\footnote>
    See section <reference|linux-dir> for reference
  </footnote>. The <verbatim|ipv4/> subfolder contains 94 files, with 30 of
  them TCP related. Additionally the TCP Code belongs to two different
  groups: a) tcp-core and b) congestion-control algorithms. This all make the
  <verbatim|ipv4/> directory a bit unclear. Putting the 30 TCP related files
  into a own <verbatim|tcp/> sub directory with a own <verbatim|cc-algos/>
  sub directory would be possible way of improvement here.

  <subsection|File Lengths>

  C Files along with directories and functions are one of the few ways to
  establish modularity and separation in C
  projects<cite|thomas2010effective>. Therefore looking at them can tell you
  a lot about a c-projects modularity. For good Modularization it's important
  to choose the modules not to be too big, but also not as too small. But
  what are appropriate sizes for C files? It's difficult to find a definitive
  recommendation in the literature. D. Spinellis says\ 

  <\quote-env>
    Most files are less than 2000 lines long. Overly long files (such as the
    C files in OpenSolaris and the WRK) are often problematic because they
    can be difficult to manage, they may create many dependencies and they
    may violate modularity.<cite|Spi08b>
  </quote-env>

  And then goes on by just using \Plesser is better\Q in the following
  analysis. We would like to establish a limit of 2500 lines<\footnote>
    This number was established by a small survey of our colleagues and
    fellow hackers. Nevertheless it's just a proposal, no established
    standard.
  </footnote> here. And define files over 2500 lines as \Pperhaps
  problematic\Q besides they have a good reason for.

  <subsubsection|LWIP>

  Let's start with LWIP and count the lines using the UNIX command
  <verbatim|wc -l>

  <\big-figure>
    <\code>
      \ \<gtr\> wc -l *.c \| sort -n

      \;

      \ \ 1616 tcp_out.c

      \ \ 1813 tcp_in.c

      \ \ 2097 tcp.c

      \ \ 

      \ \ 5526 total
    </code>
  </big-figure|File Lengths in the LWIP TCP Implementation>

  \ So again, LWIP scores quite good here.

  <subsubsection|Linux TCP>

  The same procedure for Linux TCP in figure <reference|linux-file-lenghts>:

  <\big-figure>
    <\code>
      \ \<gtr\> wc -l *.c \| sort -n

      \;

      \ \ \ 109 tcp_recovery.c

      \ \ \ 327 tcp_fastopen.c

      \ \ \ 450 tcp_cong.c

      \ \ \ 707 tcp_timer.c

      \ \ \ 836 tcp_minisocks.c

      \ \ 1186 tcp_metrics.c

      \ \ 3334 tcp.c

      \ \ 3578 tcp_output.c

      \ \ 6366 tcp_input.c

      \;

      \ 16893 total\ 
    </code>
  </big-figure|<label|linux-file-lenghts>File Lengths in the Linux TCP
  Implementation>

  Of the 9 analysed files 6 are quite small and only implement specialised
  features, which is good and nicely organised. Nevertheless there are 2
  somehow problematic files (<verbatim|tcp.c> and <verbatim|tcp_output.c>)
  and problematic file <verbatim|tcp_input.c>.\ 

  It's interesting that processing incoming tcp segments requires about
  double the code of processing outgoing tcp segments. This can perhaps be,
  because processing incoming segments also includes a lot of:

  <\itemize>
    <item>Parsing

    <item>Decision making on what to do with the segment

    <item>Verifying sequence numbers

    <item>and perhaps some extended TCP features like TCP Sack or Fack
  </itemize>

  Nevertheless we decided to give the file <verbatim|tcp_input.c> a look
  using the statistics we obtained for the closer function analysis. We
  filtered these to only contain functions in <verbatim|tcp_input.c> and
  discovered something: 22 functions<\footnote>
    See Appendix <reference|tcp-sack-appendix>
  </footnote> there contain the string <verbatim|sack> in them, as in
  selective Acknowledgements one of the TCP Extensions implemented in Linux
  TCP <cite|RFC2018><cite|man-tcp>. They comprise a semantic group good to be
  put into a own file like <verbatim|tcp_sack.c>. The same goes for parsing,
  or ECN.

  \;

  <subsection|Function Lengths>

  Overly long function are bad for readability, understanding and
  maintainability.

  When talking about function lengths the same thoughts about modularization
  and scope as for file lengths apply. Additionally now we have a standard!
  At least for Linux, because the Coding Style file in the Linux
  tree<cite|coding-style-linux> gives us something to work with:\ 

  <\verbatim>
    <\quotation>
      <verbatim|>Functions should be short and sweet, and do just one thing.
      They should fit on one or two screenfuls of text (the ISO/ANSI screen
      size is 80x24, as we all know), and do one thing and do that well.
    </quotation>
  </verbatim>

  So now we have a concrete number: 48 lines. He then goes into one
  exception:

  \;

  <\verbatim>
    \ \ \ The maximum length of a function is inversely proportional to the

    complexity and indentation level of that function. \ So, if you have a

    conceptually simple function that is just one long (but simple)

    case-statement, where you have to do lots of small things for a lot of

    different cases, it's OK to have a longer function.
  </verbatim>

  \;

  Which makes sense. We will consider this when we discover a longer
  function. What Linus describes here as \Pcomplexity and indentation level\Q
  fits well with what we note as \Pcyclomatic complexity in the next section.

  <subsubsection|LWIP>

  First some general stats about the functions in the LWIP TCP code:

  <big-table|<tabular|<tformat|<table|<row|<cell|>>>>><block|<tformat|<table|<row|<cell|Number
  of Functions>|<cell| 79>>|<row|<cell|Longest Function (Lines)>|<cell|
  692>>|<row|<cell|Shortest Function (Lines)>|<cell| 5>>>>>|General
  Statistics About The Functions in LWIP TCP Code>

  The longest function looks quite worrisome, but let's look at the
  distribution of function lengths first:\ 

  <big-figure|<image|Anhang/tcp_implementations/lwip-2.0.0-release/results/wrapper_restored/histogramm_all_functions.ps|400pt|190pt||>|<label|lwip-histogram>LWIP:
  Histogram of Function Lengths>

  In figure <reference|lwip-histogram> the histogram bins have a width of 25
  , meaning, the first bar contains all functions with a length in
  <math|<around*|[|0,25|]>> the second all functions with a length in
  <math|<around*|]|25,50|]>>, etc. The number on the y-Axis is the relative
  density, i.e. the number of functions in this bin, divided by the width of
  this bin (i.e. 25).\ 

  In this figure we recognise several facts:

  <\enumerate>
    <item>Most of the functions are shorter than 50 lines (59 functions of
    79)

    <item>There are some black sheep with lengths between 200 and 500 lines

    <item>There is one black sheep with a length of almost 700 lines (697 to
    be precise)
  </enumerate>

  The high number of functions with length below 50 lines is pleasant.
  Nevertheless 697 is quite long, lets take a short look at this function
  it's <verbatim|tcp_receive()> from <verbatim|tcp_in.c>.\ 

  To better understand the meaning of <verbatim|tcp_receive()> a comment from
  the header of <verbatim|tcp_in.c> may be helpful:\ 

  <\code>
    /**

    \ * @file

    \ * Transmission Control Protocol, incoming traffic

    \ *

    \ * The input processing functions of the TCP layer.

    \ *

    \ * These functions are generally called in the order (ip_input()
    -\<gtr\>)

    \ * tcp_input() -\<gtr\> * tcp_process() -\<gtr\> tcp_receive() (-\<gtr\>
    application).

    \ *

    \ */
  </code>

  So <verbatim|tcp_receive()> is called quite late in the TCP processing
  path. And from the Doxygen comment describing <verbatim|tcp_receive()>

  <\code>
    /**

    \ * Called by tcp_process. Checks if the given segment is an ACK for
    outstanding

    \ * data, and if so frees the memory of the buffered data. Next, it
    places the

    \ * segment on any of the receive queues (pcb-\<gtr\>recved or
    pcb-\<gtr\>ooseq). If the\ 

    \ * segment

    \ * is buffered, the pbuf is referenced by pbuf_ref so that it will not
    be freed\ 

    \ * until

    \ * it has been removed from the buffer.

    \ *

    \ * If the incoming segment constitutes an ACK for a segment that was
    used for RTT

    \ * estimation, the RTT is estimated here as well.

    \ *

    \ * Called from tcp_process().

    \ */
  </code>

  So <verbatim|tcp_receive()> does <strong|a lot>. Completely different from
  Torvalds advice <verbatim|"be short and sweet, and do just one thing">. But
  why? Well, one reason could be, that the LWIP authors completely forgot all
  good design rules and this function just got out of hand. We don't believe
  this, simply because all the other code is structured and documented so
  well. So why then? This function lies on a hot code path and is called for
  almost<\footnote>
    it's not called for incoming packets that are empty ACKs
  </footnote> every incoming TCP packet, so for performance? Perhaps, but
  then, usually functions can be split up without any performance penalty
  when every split up function uses the <verbatim|inline> keyword. But why is
  this not done here? A short search over the whole LWIP code showed that
  LWIP never uses the inline keyword, on no single function, so perhaps this
  is some internal standard. And because of this standard they had to keep
  <verbatim|tcp_receive()> that long. But don't forget that's just our
  hypothesis, we don't know the real cause.

  <subsubsection|Linux>

  Let's start with the same general statistics as stated for LWIP:

  <big-table|<block|<tformat|<table|<row|<cell|Number of
  Functions>|<cell|408>>|<row|<cell|Longest Function
  (Lines)>|<cell|336>>|<row|<cell|Shortest Function
  (Lines)>|<cell|4>>>>>|General Statistics About The Functions in LWIP TCP
  Code>

  So here we have a black sheep too. Well maybe not as black as the previous
  one rather a dark-gray sheep. But let's look at the distribution:

  <big-figure|<image|<tuple|<#252150532D41646F62652D332E300A252543726561746F723A20636169726F20312E31342E362028687474703A2F2F636169726F67726170686963732E6F7267290A25254372656174696F6E446174653A20546875204465632032322030383A32303A313320323031360A252550616765733A20310A2525446F63756D656E74446174613A20436C65616E374269740A25254C616E67756167654C6576656C3A20320A2525446F63756D656E744D656469613A203130387836366D6D203330382031383620302028292028290A2525426F756E64696E67426F783A2030203020333038203138360A2525456E64436F6D6D656E74730A2525426567696E50726F6C6F670A2F6C616E67756167656C6576656C2077686572650A7B20706F70206C616E67756167656C6576656C207D207B2031207D206966656C73650A32206C74207B202F48656C7665746963612066696E64666F6E74203132207363616C65666F6E7420736574666F6E7420353020353030206D6F7665746F0A20202854686973207072696E74206A6F62207265717569726573206120506F7374536372697074204C616E6775616765204C6576656C2032207072696E7465722E292073686F770A202073686F77706167652071756974207D2069660A2F71207B206773617665207D2062696E64206465660A2F51207B2067726573746F7265207D2062696E64206465660A2F636D207B2036206172726179206173746F726520636F6E636174207D2062696E64206465660A2F77207B207365746C696E657769647468207D2062696E64206465660A2F4A207B207365746C696E65636170207D2062696E64206465660A2F6A207B207365746C696E656A6F696E207D2062696E64206465660A2F4D207B207365746D697465726C696D6974207D2062696E64206465660A2F64207B2073657464617368207D2062696E64206465660A2F6D207B206D6F7665746F207D2062696E64206465660A2F6C207B206C696E65746F207D2062696E64206465660A2F63207B206375727665746F207D2062696E64206465660A2F68207B20636C6F736570617468207D2062696E64206465660A2F7265207B206578636820647570206E65672033203120726F6C6C2035203320726F6C6C206D6F7665746F203020726C696E65746F0A20202020202030206578636820726C696E65746F203020726C696E65746F20636C6F736570617468207D2062696E64206465660A2F53207B207374726F6B65207D2062696E64206465660A2F66207B2066696C6C207D2062696E64206465660A2F662A207B20656F66696C6C207D2062696E64206465660A2F6E207B206E657770617468207D2062696E64206465660A2F57207B20636C6970207D2062696E64206465660A2F572A207B20656F636C6970207D2062696E64206465660A2F4254207B207D2062696E64206465660A2F4554207B207D2062696E64206465660A2F7064666D61726B207768657265207B20706F7020676C6F62616C64696374202F3F7064666D61726B202F65786563206C6F616420707574207D0A202020207B20676C6F62616C6469637420626567696E202F3F7064666D61726B202F706F70206C6F616420646566202F7064666D61726B0A202020202F636C656172746F6D61726B206C6F61642064656620656E64207D206966656C73650A2F424443207B206D61726B2033203120726F6C6C202F424443207064666D61726B207D2062696E64206465660A2F454D43207B206D61726B202F454D43207064666D61726B207D2062696E64206465660A2F636169726F5F73746F72655F706F696E74207B202F636169726F5F706F696E745F79206578636820646566202F636169726F5F706F696E745F78206578636820646566207D206465660A2F546A207B2073686F772063757272656E74706F696E7420636169726F5F73746F72655F706F696E74207D2062696E64206465660A2F544A207B0A20207B0A202020206475700A2020202074797065202F737472696E67747970652065710A202020207B2073686F77207D207B202D302E303031206D756C203020636169726F5F666F6E745F6D617472697820647472616E73666F726D20726D6F7665746F207D206966656C73650A20207D20666F72616C6C0A202063757272656E74706F696E7420636169726F5F73746F72655F706F696E740A7D2062696E64206465660A2F636169726F5F73656C656374666F6E74207B20636169726F5F666F6E745F6D617472697820616C6F616420706F7020706F7020706F70203020302036206172726179206173746F72650A20202020636169726F5F666F6E7420657863682073656C656374666F6E7420636169726F5F706F696E745F7820636169726F5F706F696E745F79206D6F7665746F207D2062696E64206465660A2F5466207B20706F70202F636169726F5F666F6E74206578636820646566202F636169726F5F666F6E745F6D61747269782077686572650A2020202020207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F5464207B206D6174726978207472616E736C61746520636169726F5F666F6E745F6D6174726978206D617472697820636F6E6361746D6174726978206475700A2020202020202F636169726F5F666F6E745F6D617472697820657863682064656620647570203420676574206578636820352067657420636169726F5F73746F72655F706F696E740A2020202020202F636169726F5F666F6E74207768657265207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F546D207B203220636F70792038203220726F6C6C2036206172726179206173746F7265202F636169726F5F666F6E745F6D61747269782065786368206465660A202020202020636169726F5F73746F72655F706F696E74202F636169726F5F666F6E74207768657265207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F67207B2073657467726179207D2062696E64206465660A2F7267207B20736574726762636F6C6F72207D2062696E64206465660A2F6431207B207365746361636865646576696365207D2062696E64206465660A2F636169726F5F7365745F706167655F73697A65207B0A202025204368616E67652070617065722073697A652C20627574206F6E6C7920696620646966666572656E742066726F6D2070726576696F75732070617065722073697A65206F74686572776973650A202025206475706C6578206661696C732E20504C524D20737065636966696573206120746F6C6572616E6365206F66203520707473207768656E206D61746368696E672070617065722073697A650A20202520736F20776520757365207468652073616D65207768656E20636865636B696E67206966207468652073697A65206368616E6765732E0A20202F73657470616765646576696365207768657265207B0A20202020706F702063757272656E74706167656465766963650A202020202F5061676553697A65206B6E6F776E207B0A2020202020203220636F70790A20202020202063757272656E7470616765646576696365202F5061676553697A652067657420616C6F616420706F700A202020202020657863682034203120726F6C6C0A2020202020207375622061627320352067740A20202020202033203120726F6C6C0A2020202020207375622061627320352067740A2020202020206F720A202020207D207B0A202020202020747275650A202020207D206966656C73650A202020207B0A20202020202032206172726179206173746F72650A20202020202032206469637420626567696E0A20202020202020202F5061676553697A652065786368206465660A20202020202020202F496D6167696E6742426F78206E756C6C206465660A20202020202063757272656E746469637420656E640A202020202020736574706167656465766963650A202020207D207B0A202020202020706F7020706F700A202020207D206966656C73650A20207D207B0A20202020706F700A20207D206966656C73650A7D206465660A2525456E6450726F6C6F670A2525426567696E53657475700A2525426567696E5265736F757263653A20666F6E742044656A61567553616E730A3131206469637420626567696E0A2F466F6E7454797065203432206465660A2F466F6E744E616D65202F44656A61567553616E73206465660A2F5061696E74547970652030206465660A2F466F6E744D6174726978205B203120302030203120302030205D206465660A2F466F6E7442426F78205B2030203020302030205D206465660A2F456E636F64696E6720323536206172726179206465660A30203120323535207B20456E636F64696E672065786368202F2E6E6F7464656620707574207D20666F720A456E636F64696E67203332202F7370616365207075740A456E636F64696E67203436202F706572696F64207075740A456E636F64696E67203438202F7A65726F207075740A456E636F64696E67203439202F6F6E65207075740A456E636F64696E67203530202F74776F207075740A456E636F64696E67203531202F7468726565207075740A456E636F64696E67203532202F666F7572207075740A456E636F64696E67203534202F736978207075740A456E636F64696E67203536202F6569676874207075740A456E636F64696E67203730202F46207075740A456E636F64696E67203736202F4C207075740A456E636F64696E67203939202F63207075740A456E636F64696E6720313031202F65207075740A456E636F64696E6720313033202F67207075740A456E636F64696E6720313034202F68207075740A456E636F64696E6720313035202F69207075740A456E636F64696E6720313130202F6E207075740A456E636F64696E6720313131202F6F207075740A456E636F64696E6720313135202F73207075740A456E636F64696E6720313136202F74207075740A456E636F64696E6720313137202F75207075740A2F43686172537472696E677320323220646963742064757020626567696E0A2F2E6E6F746465662030206465660A2F7A65726F2031206465660A2F706572696F642032206465660A2F6F6E652033206465660A2F74776F2034206465660A2F74687265652035206465660A2F666F75722036206465660A2F462037206465660A2F752038206465660A2F6E2039206465660A2F63203130206465660A2F74203131206465660A2F69203132206465660A2F6F203133206465660A2F7370616365203134206465660A2F4C203135206465660A2F65203136206465660A2F67203137206465660A2F68203138206465660A2F73203139206465660A2F736978203230206465660A2F6569676874203231206465660A656E6420726561646F6E6C79206465660A2F73666E7473205B0A3C303030313030303030303039303038303030303330303130363337363734323030303639316433393030303030643563303030303031666536363730363736643731333437363661303030300A306635633030303030306162363736633739363633343437326531343030303030303963303030303063633036383635363136343064313362653336303030303130303830303030303033360A363836383635363130643966303738333030303031303430303030303030323436383664373437383632396230633338303030303130363430303030303035383663366636333631303030300A383431383030303031306263303030303030356336643631373837303034383330363731303030303131313830303030303032303730373236353730336230376631303030303030313133380A303030303035363830303032303036366665393630343636303561343030303330303037303031613430306330346662303030366662303130383035376630323034303032666334643465630A333130303130643465636434656333303133313132313131323532313131323136363034303066633733303331626663653566653936303730656638663237323036323930303032303038370A666665333034386630356630303030623030313730303233343031333036613031323030613030633931313238633138303931633066316530333163313531623138313066636563663465630A333130303130653466346563313065653330303132323032313131303132333333323132313131303032323733323030313131303030323332323030313131303030303238623963396439640A396339643964396439646662303130396665663766626662666566373031303930353530666563646665636366656364666563643031333330313333303133343031333361306665373366650A383666653837666537333031386430313739303137613031386430303030303130306462303030303031616530306665303030333030313162373030383330323031313930303138303431300A666365633331303032666563333033373333313532336462643364336665666530303031303065313030303030343561303564353030306130303430343031353432303361303034303261300A303538313037303061303039303831663036316330333030316630313062313064343462623030663534353862393030303130303430333835396563633466636563333130303266656333320A663465636434656333303462353335383539323230316234306630333066303430323564333732313131303533353235333331313231313532316665303134616665393930313635636130310A346166636134616130343733343862383438666164356161303030303030303130303936303030303034346130356630303031633030396534303237313931613162303331383163313130350A303430303131303530353034343231306131313139343064613031343931303430306130303230303130306130323031306131633137313030333036316431306663346262303135353434620A623031363534356234626230313435343562353862393030303366666330333835396334643465636330633031313132333933313030326665633332663465636634656333303462353335380A303731303035656430373035656430316230316331303131313733393539323230313430333235353034353630353536303737613034376130353736316238373139303730343030303431390A303431613034316230353163373430303736303637353161373331623734316338323030383631393832316138323162383231636138303061383162313135643030356432353231313532310A333533363030333733653031333533343236323332323036303733353365303133333332303431353134303630373036303030313839303263316663346337333031386433333631346461370A383635666433373837616434353865383031313434353562313966656634616161616161373730313931336136643937343937373936343234336363333133326538633235636135373031640A666565623030303030303031303039636666653330343733303566303030323830303730343032653030313531333061383630393166383632303133613031353064613030393933303631630A613032303933323339313036386331356133323931363163313330303033313431393163323632303130316330333134316630393036323931306663346262303136353434626230313435340A356235386239303030396666633033383539633463346434656366346563313131373339333933313030313065636534663465346563313065366565313065653130656531306565313131320A333933303031343030393634316536313166363132303634323130343030356430313165303131353134303432313232323632373335316530313333333233363335333432363262303133350A333333323336333533343236323332323036303733353365303133333332303431353134303630333366393161336665643066656538356563373661353463383664626563376239613561650A623639353965613339383533626537323733633935396536303130633865303332353166633439306464663232353235633333313332393638663834393561363737373037333762323432360A623432303230643162323763616230303030303230303634303030303034613430356435303030323030306430303831343031643031306430333064303030333033306434323030303330620A303761303035303130333831303930313063306130303163303630383034306330653130646334626230306235343462623030643534356235386239303030636666633033383539643433630A633465633332313133393331303032666534643433636563333231323339333034623533353830373130303463393037313030356339353932323031343032613062303032613030343830300A353930303639303037373030386130303037313630313262303032363031326230333336303134653031346630633466306435363031363630313735303137613033383530313064356430300A356430393031323130333333313133333135323331313233313132313335303330366665303230316665333566656435643563396664356530353235666365333033636466633333613866650A613030313630633330303030303030313030633930303030303432333035643530303039303032393430313230363935303430323935303038313034616430383035303130373033316330300A303430613130666365633332643463343331303032666563663465633130656533306232306630623031303135643133323131353231313132313135323131313233633930333561666437300A303235306664623063613035643561616665343861616664333730303030303230306165666665333034353830343762303031333030313430303362343031633033303930303033306530310A303638373065313138633061303162633134623830633064303930383134306234653032303830303436313531306663656366343339656333323331303032666534653433326634633465630A313131323137333933306234366631356330313530323031356431333131333331313134313633333332333633353131333331313233333530653031323332323236303161656238376337630A393561646238623834336231373563316338303163663031626130326136666436313966396662656134303237626662613061633636363366303033613830303030303130306261303030300A303436343034376230303133303033363430313930333039303030333065303130363837306531316238306362633061303130323038303034653064303930383062343631343130666365630A333266346563333130303266336365346634633465633131313231373339333062343630313563663135303230313564303131313233313133343236323332323036313531313233313133330A313533653031333333323136303436346238376337633935616362396239343262333735633163363032613466643563303239653966396562656134666438373034363061653635363465660A303030313030373166666533303365373034376230303139303033663430316230303836303138383034306538363064383830616239313130346239313762383131386331613037313230640A303034383134343531613130666365343332656333313030313065346634656331306665663465653130663565653330343030623066316231303162383031623930316261303162303530310A356430313135326530313233323230363135313431363333333233363337313530653031323332323030313131303030323133323136303365373465396435306233633663366233353039640A346534646135356466646665643630313264303130363535613230343335616332623262653363646364653332623262616132343234303133653031306530313132303133613233303030300A303030313030333730303030303266323035396530303133303033383430313930653035303830663033613930303131303162633038383730613062303830393032303430303038313031320A306534363134313066633363633466633363633433323339333933313030326665636634336363346563333231313339333933306232616631353031303135643031313132313135323131310A313431363362303131353233323232363335313132333335333331313031373730313762666538353462373362646264643561323837383730353965666563323866666461303839346539610A396664323032363038663031336530303030303030303032303063313030303030313739303631343030303330303037303032623430306530366265303462313030626330323035303130380A303430303436303831306663336365633332333130303266653466636563333034303062313030393430303935303039363030393730303930353031356431333333313132333131333331350A323363316238623862386238303436306662613030363134653930303030303230303731666665333034373530343762303030623030313730303461343031333036623931323030623930630A623831323863313830393132306635313033313231353435313831306663656366346563333130303130653466346563313065653330343032333366313937623030376230363766303737660A303837663039376630613766306237623063376630643766306537663066376631303766313137623132613031396630313931313031356430313232303631353134313633333332333633350A333432363237333230303131313030303233323230303131313030303032373339346163616239353933616361633933663030313132666565656630663166656566303131313033646665370A633963396537653863386337653939636665633866656563666565646665633730313339303131333031313430313338303030303030303130306339303030303034366130356435303030350A303032353430306330323935303038313034303131633033336130303034303631306663656365633331303032666534656333303430303933303037353030373830303338303034303430310A356431333333313132313135323163396361303264376663356630356435666164356161303030323030373166666533303437663034376230303134303031623030373034303234303031350A303130393836303838383035313561393031303562393063303162623138623931326238306338633163316231353032303831353038303034623032313230663435316331306663656366340A656363343131313233393331303031306534663465636534313065653130656531306634656531313132333933303430323933663164373031646130316464303164663031643035336630300A336630313366303233663135336631623035326330373266303832663039326330613666303036663031366630323666313536663162303935643731303135643031313532313165303133330A333233363337313530653031323332303030313131303030333333323030303732653031323332323036303730343766666362323063636462373661633736323633643036626665663466650A633730313239666365323031303762383032613538383961623930653032356535616265633733343334616532613263303133383031306130313133303134336665646463343937623461650A396530303030303230303731666535363034356130343762303030623030323830303461343032333139306331643039313238363133313662393066303362393236323362383237626330390A623930666264316131643236313930303038306334373036313231323230343532393130666363346563663465633332333233313030326663346534656365346634633465633130666564350A656531313132333933393330623636303261383032616130326130333031356430313334323632333232303631353134313633333332333631373130303232313232323632373335316530310A333333323336336430313065303132333232303231313130313233333332313631373335333330336132613539353934613561353934393561356238666566656661363161633531353139650A353262356234333962323763636566636663636537636232333962383032336463386463646363386337646364636562666565326665653931643165623332633261626462663562363336320A303133613031303330313034303133613632363361613030303030313030626130303030303436343036313430303133303033343430313930333039303030333065303130363837306531310A623830633937306130313032303830303465306430393038306234363134313066636563333266346563333130303266336365636634633465633131313231373339333062323630313530310A303135643031313132333131333432363233323230363135313132333131333331313365303133333332313630343634623837633763393561636239623934326233373563316336303261340A666435633032396539663965626561346664383730363134666439653635363465663030303030313030366666666533303363373034376230303237303065373430336330643063303230650A306235333166316530383039303230373061353331663166316534323061306231653166303431353030383630313839303431343836313538393138623931313034623932356238313138630A323831653061306231663162303730303532316230383065303730383134323234353238313066636334656364346563653431313132333933393339333933313030313065346634656331300A666566356565313066356565313231373339333034623533353830373130306565643131313733393037306565643131313733393539323262323030323730313031356434303664316330610A316330623163306332653039326330613263306232633063336230393362306133623062336230633062323030303230303132343032323830613238306232613133326631343266313532610A313632383165323831663239323032393231323432373836306138363062383630633836306431323030303030303031303230323036306130363062303330633033306430333065303330660A303331303033313930333161303331623033316330343164303932373266323933663239356632393766323938303239393032396130323966303239313835643030356437313031313532650A303132333232303631353134313631663031316530313135313430363233323232363237333531653031333333323336333533343236326630313265303133353334333633333332313630330A386234656138356138393839363239343366633461356637643835616333366336366336363138323863363561623430616239386530636536366234303433666165323832383534353434300A343932313065326139393839396362363233323362653335333535393531346235303235306632343935383239656163316530303030303030303032303038666666653330343936303566300A303030623030323430303538343032343133303630303064383630633030613031363036613031633136613531306130306338393232393131633863323530633232303931633139316531330A316330333231316631623235313066636563656366346563653433313030313065346634653466636534313065653130656531306565313131323339333034303134636230306362303163640A303263643033636430346362303563623036303761343165623231653032356430313564303132323036313531343136333333323336333533343236303131353265303132333232303230330A336530313333333230303135313430303233323030303131313030303231333231363032613438383966396638383838396639663031303934633962346363386433306633626232366265310A303130356665663065326665666466656565303135303031316234633962303333626261613261316262626261316132626130323739623832343236666566326665656635373564666565660A656265366665656130313864303137393031363230316135316530303030303030303033303038626666653330343862303566303030306230303233303032663030343334303235313830630A303061303237303661303165326461303132393131653863323761333330313830633234326131633135323431633066303931633135316231653033316330663231316233303130666363340A656366346334656331306565313065653131333933393331303031306563653466346563313065653130656533393339333030313232303631353134313633333332333633353334323632350A326530313335333432343333333231363135313430363037316530313135313430343233323232343335333433363133313431363333333233363335333432363233323230363032386239300A613561353930393061366135666561353832393130306666646564666665393138313932613366656637663766376665663761343438393138333832393339333832383339313032633539610A383738373961396238363837396135363230623238306233643064306233383062323230323263363866643965386538643938666336303136313734383238323734373438323832303030300A303133353030623830306362303063623030633130306161303039633031613630306238303036363030303030303731303063623030613030326232303038353030373530306238303063330A303163623031383930323264303063623030613630306630303064333030616130303837303063623033616130343030303134613030333330306362303030303030643930353032303066340A303135343030623430303963303133393031313430313339303730363034303030343465303462343034353230346238303465373034636430303337303437333034636430343630303437330A303133333033613230353536303561363035353630353339303363353032313230306339303031663030623830316466303037333030626130336539303333333033626330343434303430650A303064663033636430336161303065353033616130343034303030303030636230303866303061343030376230306238303031343031366630303766303237623032353230303866303063370A303563643030396130303961303036663030636230306364303139653031643330306630303062613031383330306435303039383033303430323438303039653031643530306331303063620A303066363030383330333534303237663030303030333333303236363030643330306337303061343030636430303866303039613030373330343030303564353031306130306665303232620A303061343030623430303963303030303030363230303963303030303030316430333264303564353035643530356435303566303030376630303762303035343030613430366238303631340A303732333031643330306238303063623030613630316333303165633036393330306130303064333033356330333731303364623031383530343233303461383034343830303866303133390A303131343031333930333630303038663035643530313961303631343037323330363636303137393034363030343630303436303034376230303963303030303032373730343630303161610A303065393034363030373632303037623030633530303766303237623030303030306234303235323035636430303636303062633030363630303737303631303030636430313362303138350A303338393030386630303762303030303030316430306364303734613034326630303963303039633030303030373764303036663030303030303666303333353030366130303666303037620A303061653030623230303264303339363030386630323762303066363030383330333534303633373035663630303866303039633034653130323636303038663031386430326636303063640A303334343030323930303636303465653030373330303030313430303030393630303030623730373036303530343033303230313030326332303130623030323235343936346230343035310A353832306338353932313264326362303032323534393634623034303531353832306338353932313264326332303130303732306230303035306230306437393230623866666666353035380A303431623035353962303035316362303033323530386230303432353233653132306230303035306230306437393230623866666666353035383034316230353539623030353163623030330A323530386531326432633462353035383230623066643435343435393231326432636230303232353435363034343264326334623533353862303032323562303032323534353434353932310A323132643263343534343264326362303032323562303032323534396230303532356230303532353439363062303230363336383230386131303861323333613861313036353361326430300A303030313030303030303032356562383337353532383463356630663363663530303166303830303030303030303030643364393061326330303030303030306433643930613263663764360A666334633065353930396463303030303030303830303030303030313030303030303030303030313030303030373664666531643030303030656665663764366661353130653539303030310A303030303030303030303030303030303030303030303030303030303030313630346364303036363035313730303837303238623030646230353137303065313035313730303936303531370A303039633035313730303634303439613030633930353132303061653035313230306261303436363030373130333233303033373032333930306331303465353030373130323862303030300A303437353030633930346563303037313035313430303731303531323030626130343262303036663035313730303866303531373030386230303030303030303030303030303434303030300A303063383030303030306630303030303031363030303030303236303030303030333438303030303034303430303030303435383030303030346463303030303035353430303030303565630A303030303036363830303030303662383030303030373563303030303037356330303030303761303030303030383734303030303039336330303030303962343030303030623134303030300A306265633030303030636330303030313030303030303136303335343030326230303638303030633030303230303130303039393030303830303030303431353032313630303038303030340A623830323830343066666662666530336661313430336639323530336638333230336637393630336636306530336635666530336634666530336633323530336632306530336631393630330A663032353033656638613431303565666665303365653936303365643936303365636661303365626661303365616665303365393361303365383432303365376665303365363332303365350A653435333035653539363033653438613431303565343533303365336532326630356533666130336532326630336531666530336530666530336466333230336465313430336464393630330A646366653033646231323033646137643033643962623033643866653033643638613431303564363764303364356434343730356435376430336434343730336433643231623035643366650A303364323162303364316665303364306665303363666665303363656665303363643936303363636362316530356363666530336362316530336361333230336339666530336336383531310A303563363163303363353136303363346665303363336665303363326665303363316665303363306665303362666665303362656665303362646665303362636665303362626665303362610A313130336239383632353035623966653033623862376262303562386665303362376236356430356237626230336237383030346236623532353035623635643430666630336236343030340A623532353033623466653033623339363033623266653033623166653033623066653033616666653033616536343033616430653033616361623235303561633634303361626161313230350A616232353033616131323033613938613431303561396661303361386665303361376665303361366665303361353132303361346665303361336132306530356133333230336132306530330A613136343033613038613431303561303936303339666665303339653964306330353965666530333964306330333963396231393035396336343033396239613130303539623139303339610A313030333939306130333938666530333937393630643035393766653033393630643033393538613431303539353936303339343933306530353934323830333933306530333932666130330A393139306262303539316665303339303866356430353930626230333930383030343866386532353035386635643033386634303034386532353033386466653033386338623265303538630A666530333862326530333861383632353035386134313033383938383062303538393134303338383062303338373836323530353837363430333836383531313035383632353033383531310A303338346665303338333832313130353833666530333832313130333831666530333830666530333766666530333430666637653764376430353765666530333764376430333763363430330A376235343135303537623235303337616665303337396665303337383065303337373063303337363061303337356665303337346661303337336661303337326661303337316661303337300A666530333666666530333665666530333663323130333662666530333661313134323035366135333033363966653033363837643033363731313432303536366665303336356665303336340A666530333633666530333632666530333631336130333630666130333565306330333564666530333562666530333561666530333539353830613035353966613033353830613033353731360A313930353537333230333536666530333535353431353035353534323033353431353033353330313130303535333138303335323134303335313461313330353531666530333530306230330A346666653033346534643130303534656665303334643130303334636665303334623461313330353462666530333461343931303035346131333033343931643064303534393130303334380A306430333437666530333436393630333435393630333434666530333433303232643035343366613033343262623033343134623033343066653033336666653033336533643132303533650A313430333364336330663035336431323033336333623064303533633430666630663033336230643033336166653033333966653033333833373134303533386661303333373336313030350A333731343033333633353062303533363130303333353062303333343165303333333064303333323331306230353332666530333331306230333330326630623035333030643033326630620A303332653264303930353265313030333264303930333263333230333262326132353035326236343033326132393132303532613235303332393132303332383237323530353238343130330A323732353033323632353062303532363066303332353062303332346665303332336665303332323066303332313031313030353231313230333230363430333166666130333165316430640A303531653634303331643064303331633131343230353163666530333162666130333161343230333139313134323035313966653033313836343033313731363139303531376665303331360A303131303035313631393033313566653033313466653033313366653033313231313432303531326665303331313032326430353131343230333130376430333066363430333065666530330A306430633136303530646665303330633031313030353063313630333062666530333061313030333039666530333038303232643035303866653033303731343033303636343033303430310A313030353034666530333430313530333032326430353033666530333032303131303035303232643033303131303033303066653033303162383031363438353864303132623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262303032623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262316430303E0A5D206465660A2F662D302D302063757272656E746469637420656E6420646566696E65666F6E7420706F700A2525456E645265736F757263650A2525456E6453657475700A2525506167653A203120310A2525426567696E5061676553657475700A2525506167654D656469613A203130387836366D6D0A252550616765426F756E64696E67426F783A2030203020333038203138360A3330382031383620636169726F5F7365745F706167655F73697A650A2525456E645061676553657475700A712030203020333038203138362072656374636C697020710A5120710A3120670A302E3235203138352E373520333037202D3138352E3520726520660A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D20302E3235203138352E373520333037202D3138352E3520726520530A32302E3139352033352E343639206D203239312E3735342033352E343639206C2032302E3139352033312E323139206D2032302E3139352033352E343639206C2038382E3038360A2033312E323139206D2038382E3038362033352E343639206C203135352E3937372033312E323139206D203135352E3937372033352E343639206C203232332E3836372033312E3231390A206D203232332E3836372033352E343639206C203239312E3735342033312E323139206D203239312E3735342033352E343639206C20530A42540A382030203020382031332E3538323033312032322E33323033313220546D0A2F662D302D3020312054660A5B28302E30292D36323630283130302E30295D544A0A31362E33333634323620302054640A5B283230302E30292D35363234283330302E30295D544A0A31362E39373236353620302054640A283430302E3029546A0A3130203020302031302039342E38353933373520362E39303133363720546D0A5B284629353528756E6374696F6E204C29313728656E67746820696E204C696E6573295D544A0A45540A32302E3139352033352E343639206D2032302E313935203137372E303531206C2031352E3934352033352E343639206D2032302E3139352033352E343639206C2031352E3934350A2036332E373835206D2032302E3139352036332E373835206C2031352E3934352039322E313032206D2032302E3139352039322E313032206C2031352E393435203132302E3431380A206D2032302E313935203132302E343138206C2031352E393435203134382E373334206D2032302E313935203134382E373334206C2031352E393435203137372E303531206D2032302E3139350A203137372E303531206C20530A42540A3820302030203820382E3838323831322033322E39343932313920546D0A2F662D302D3020312054660A283029546A0A3020332E3533393535312054640A283229546A0A3020332E3533393535312054640A283429546A0A3020332E3533393535312054640A283629546A0A3020332E3533393535312054640A283829546A0A2D302E363336323320332E3533393535312054640A28313029546A0A45540A5120710A32302E31393520313732203233372E383035202D3133362E3533312072652057206E0A3020670A32302E3139352033352E343639206D2032302E313935203137312E333837206C2033372E313638203137312E333837206C2033372E3136382039302E343032206C2035342E3134310A2039302E343032206C2035342E3134312035302E313931206C2037312E3131332035302E313931206C2037312E3131332034352E303938206C2038382E3038362034352E303938200A6C2038382E3038362033392E343334206C203132322E3033312033392E343334206C203132322E3033312033372E373334206C203133392E3030342033372E373334206C203133392E3030340A2033362E363032206C203135352E3937372033362E363032206C203135352E3937372033372E313638206C203137322E3934392033372E313638206C203137322E3934392033362E3630320A206C203138392E3932322033362E363032206C203138392E3932322033362E303335206C203232332E3836372033362E303335206C203232332E3836372033352E343639206C203234302E38340A2033352E343639206C203234302E38342033362E303335206C203235372E3830392033362E303335206C203235372E3830392033352E343639206C20680A32302E3139352033352E343639206D20660A5120710A32302E31393520313732203233382E383035202D3133362E3533312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2032302E3139352033352E343639206D2032302E313935203137312E333837206C2033372E313638203137312E333837206C2033372E3136382039302E343032206C2035342E3134310A2039302E343032206C2035342E3134312035302E313931206C2037312E3131332035302E313931206C2037312E3131332034352E303938206C2038382E3038362034352E303938200A6C2038382E3038362033392E343334206C203132322E3033312033392E343334206C203132322E3033312033372E373334206C203133392E3030342033372E373334206C203133392E3030340A2033362E363032206C203135352E3937372033362E363032206C203135352E3937372033372E313638206C203137322E3934392033372E313638206C203137322E3934392033362E3630320A206C203138392E3932322033362E363032206C203138392E3932322033362E303335206C203232332E3836372033362E303335206C203232332E3836372033352E343639206C203234302E38340A2033352E343639206C203234302E38342033362E303335206C203235372E3830392033362E303335206C203235372E3830392033352E343639206C20680A32302E3139352033352E343639206D20530A5120510A73686F77706167650A2525547261696C65720A2525454F460A>|ps>|300pt|||>|<label|linux-histogram>Linux
  TCP: Histogram of Function Lengths>

  In figure <reference|linux-histogram> the histogram bins have a width of 25
  , meaning, the first bar contains all functions with a length in
  <math|<around*|[|0,25|]>> the second all functions with a length in
  <math|<around*|]|25,50|]>>, etc. The number on the y-Axis is the relative
  density, i.e. the number of functions in this bin, divided by the width of
  this bin (i.e. 25).\ 

  From this graph we see several things:

  <\enumerate>
    <item>Most of the functions are shorter than 50 lines, which is good.
    (337 from 408, so over <math|3/4>)

    Probably a lot of them are small accessor and converter expressions,
    which would otherwise be directly used. Putting such expressions in a own
    function is good because it adds a lot semantic about what this code
    does, which is not contained in the pure expression.

    <item>There are some gray sheep around 200 lines

    <item>And one (barely visible) gray sheep at 325-350 (336 lines to be
    precise)
  </enumerate>

  So in general the distribution is quite similar, with the difference that
  the black sheep of Linux is less black.

  But lets take a look at this black sheep it's <verbatim|tcp_recvmsg()> in
  <verbatim|tcp.c>. It has a short header comment saying:

  <\code>
    /*

    \ * \ \ \ \ \ This routine copies from a sock struct into the user
    buffer.

    \ * \ \ \ \ \ [...]

    \ */
  </code>

  Copying data from the socket to the user buffer happens at the very end of
  TCP processing. Technically it happens even after TCP processing. Since TCP
  processing ends and succeeds when the unboxed data has been placed in the
  socket's buffer. <verbatim|tcp_recvmsg()> is called independently, from the
  <verbatim|read()> syscall in the user space.<cite|rosen2013linux>

  So <verbatim|tcp_recvmsg()> does something different, from the black sheep
  in LWIP. This is a bit disappointing, because if two functions doing
  roughly the same would be very long that would indicate there is a reason
  for their size.

  But let's discuss a bit about <verbatim|tcp_recvmsg()>, looking at it's
  full head:

  <\code>
    int tcp_recvmsg(struct sock *sk, struct msghdr *msg, size_t len, int
    nonblock,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ int flags, int *addr_len)
  </code>

  we see that it takes 6 arguments, which is also no good sign <cite|Spi08b>.
  Here we think this function is historical inherited bad code, because in
  Linux <verbatim|static inline> functions<\footnote>
    static before a function means \Pprivate to this compilation unit\Q.
    Actually the static keyword in C is a bit confusing since it's meaning
    depends on whether it is placed in global or function local scope.
  </footnote> are available and quite common, They are also used in this very
  file. Since this function uses 7 goto labels, it would be possible to put
  at least some of this label specific code and put it into a own inline
  function. It would be possible that we're overlooking something here (cache
  bloat of inline functions? <cite|coding-style-linux>) but currently that
  would be our measurement.

  <subsection|Cyclomatic Complexity (CC)>

  Another more sophisticated tool for understanding the complexity of a
  function is the \Pcyclomatic complexity\Q or \PMcCabe Complexity\Q. It is
  the number of independent control flow paths in a
  function.<cite|mccabe1976complexity> So for example the following function
  from the Linux kernel has a CC of 1

  <\code>
    static inline bool forced_push(const struct tcp_sock *tp)

    {

    \ \ \ \ \ \ \ \ return after(tp-\<gtr\>write_seq, tp-\<gtr\>pushed_seq +
    (tp-\<gtr\>max_window \<gtr\>\<gtr\> 1));

    }
  </code>

  and this one has a CC of 4:

  <\code>
    void tcp_shutdown(struct sock *sk, int how)

    {

    \ \ \ \ \ \ \ \ /* \ \ \ \ \ We need to grab some memory, and put
    together a FIN,

    \ \ \ \ \ \ \ \ \ * \ \ \ \ \ and then put it into the queue to be sent.

    \ \ \ \ \ \ \ \ \ * \ \ \ \ \ \ \ \ \ \ \ \ \ Tim
    MacKenzie(tym@dibbler.cs.monash.edu.au) 4 Dec '92.

    \ \ \ \ \ \ \ \ \ */

    \ \ \ \ \ \ \ \ if (!(how & SEND_SHUTDOWN))

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return;

    \;

    \ \ \ \ \ \ \ \ /* If we've already sent a FIN, or it's a closed state,
    skip this. */

    \ \ \ \ \ \ \ \ if ((1 \<less\>\<less\> sk-\<gtr\>sk_state) &

    \ \ \ \ \ \ \ \ \ \ \ \ (TCPF_ESTABLISHED \| TCPF_SYN_SENT \|

    \ \ \ \ \ \ \ \ \ \ \ \ \ TCPF_SYN_RECV \| TCPF_CLOSE_WAIT)) {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ /* Clear out any half completed packets.
    \ FIN if needed. */

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if (tcp_close_state(sk))

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ tcp_send_fin(sk);

    \ \ \ \ \ \ \ \ }

    }
  </code>

  because there are four possible ways to go through this function.\ 

  From this little example it may also be obvious that functions with a lower
  CC are easier to understand. And since difficult to understand functions
  mean havoc for maintainability a lower CC is better for
  maintainability<cite|Spi08b>. But is there a sensible limit to not overstep
  for a function to be good. Perhaps. In a second paper the inventor of this
  metric McCabe recommends to use \ a limit of 10 during development. Every
  time a function oversteps this it should be split up, or if there is a good
  reason for overstepping, at least add a comment
  why.<cite|maccabe1983structured>\ 

  So with this background established lets look at the two TCP
  implementations:

  <subsubsection|LWIP>

  <big-figure|<image|Anhang/tcp_implementations/lwip-2.0.0-release/results/wrapper_restored/Cyclomatic_complexity_2.ps|240pt|216pt||>|<label|lwip-cc>Histogram
  of the Cyclomatic Complexity distribution of the LWIP TCP Functions>

  In figure <reference|lwip-cc> we chose a width of 5 for each bin, so the
  first bar contains all functions with a CC in <math|<around*|[|0,5|[>>, the
  second all functions in <math|<around*|[|5,10|[>>, etc.

  Please note the following:

  <\itemize>
    <item>For one function <verbatim|tcp_input()> our tool could not
    calculate the cyclomatic complexity. So we are missing an value here.
    <verbatim|tcp_input()> is the second longest of all functions in LWIP TCP
    with a length of 428 Lines. So we estimate it probably has a high CC too
    perhaps around 80. But since that is a pure guess we decided not to take
    it into our results
  </itemize>

  These results tell us:

  <\enumerate>
    <item>The majority (63 of 79) of the functions lies in the sweet spot of
    CC <math|\<in\><around*|[|0,10|]>>, which is great

    <item>There are a few (3) black sheep with CC values between 40 and 55\ 

    <item>There is one very black sheep with a cyclomatic Complexity of 104
  </enumerate>

  Interestingly this is the same black sheep as before when we looked at
  function lengths namely: <verbatim|tcp_receive()>. Which makes this
  function look problematic once more.

  <subsubsection|Linux TCP>

  Now let's look at the distribution of cyclomatic complexity in the Linux
  kernel:

  <big-figure|<image|<tuple|<#252150532D41646F62652D332E300A252543726561746F723A20636169726F20312E31342E362028687474703A2F2F636169726F67726170686963732E6F7267290A25254372656174696F6E446174653A20467269204465632032332030353A31303A323320323031360A252550616765733A20310A2525446F63756D656E74446174613A20436C65616E374269740A25254C616E67756167654C6576656C3A20320A2525446F63756D656E744D656469613A203130317837346D6D203238372032313120302028292028290A2525426F756E64696E67426F783A2030202D3120323838203231310A2525456E64436F6D6D656E74730A2525426567696E50726F6C6F670A2F6C616E67756167656C6576656C2077686572650A7B20706F70206C616E67756167656C6576656C207D207B2031207D206966656C73650A32206C74207B202F48656C7665746963612066696E64666F6E74203132207363616C65666F6E7420736574666F6E7420353020353030206D6F7665746F0A20202854686973207072696E74206A6F62207265717569726573206120506F7374536372697074204C616E6775616765204C6576656C2032207072696E7465722E292073686F770A202073686F77706167652071756974207D2069660A2F71207B206773617665207D2062696E64206465660A2F51207B2067726573746F7265207D2062696E64206465660A2F636D207B2036206172726179206173746F726520636F6E636174207D2062696E64206465660A2F77207B207365746C696E657769647468207D2062696E64206465660A2F4A207B207365746C696E65636170207D2062696E64206465660A2F6A207B207365746C696E656A6F696E207D2062696E64206465660A2F4D207B207365746D697465726C696D6974207D2062696E64206465660A2F64207B2073657464617368207D2062696E64206465660A2F6D207B206D6F7665746F207D2062696E64206465660A2F6C207B206C696E65746F207D2062696E64206465660A2F63207B206375727665746F207D2062696E64206465660A2F68207B20636C6F736570617468207D2062696E64206465660A2F7265207B206578636820647570206E65672033203120726F6C6C2035203320726F6C6C206D6F7665746F203020726C696E65746F0A20202020202030206578636820726C696E65746F203020726C696E65746F20636C6F736570617468207D2062696E64206465660A2F53207B207374726F6B65207D2062696E64206465660A2F66207B2066696C6C207D2062696E64206465660A2F662A207B20656F66696C6C207D2062696E64206465660A2F6E207B206E657770617468207D2062696E64206465660A2F57207B20636C6970207D2062696E64206465660A2F572A207B20656F636C6970207D2062696E64206465660A2F4254207B207D2062696E64206465660A2F4554207B207D2062696E64206465660A2F7064666D61726B207768657265207B20706F7020676C6F62616C64696374202F3F7064666D61726B202F65786563206C6F616420707574207D0A202020207B20676C6F62616C6469637420626567696E202F3F7064666D61726B202F706F70206C6F616420646566202F7064666D61726B0A202020202F636C656172746F6D61726B206C6F61642064656620656E64207D206966656C73650A2F424443207B206D61726B2033203120726F6C6C202F424443207064666D61726B207D2062696E64206465660A2F454D43207B206D61726B202F454D43207064666D61726B207D2062696E64206465660A2F636169726F5F73746F72655F706F696E74207B202F636169726F5F706F696E745F79206578636820646566202F636169726F5F706F696E745F78206578636820646566207D206465660A2F546A207B2073686F772063757272656E74706F696E7420636169726F5F73746F72655F706F696E74207D2062696E64206465660A2F544A207B0A20207B0A202020206475700A2020202074797065202F737472696E67747970652065710A202020207B2073686F77207D207B202D302E303031206D756C203020636169726F5F666F6E745F6D617472697820647472616E73666F726D20726D6F7665746F207D206966656C73650A20207D20666F72616C6C0A202063757272656E74706F696E7420636169726F5F73746F72655F706F696E740A7D2062696E64206465660A2F636169726F5F73656C656374666F6E74207B20636169726F5F666F6E745F6D617472697820616C6F616420706F7020706F7020706F70203020302036206172726179206173746F72650A20202020636169726F5F666F6E7420657863682073656C656374666F6E7420636169726F5F706F696E745F7820636169726F5F706F696E745F79206D6F7665746F207D2062696E64206465660A2F5466207B20706F70202F636169726F5F666F6E74206578636820646566202F636169726F5F666F6E745F6D61747269782077686572650A2020202020207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F5464207B206D6174726978207472616E736C61746520636169726F5F666F6E745F6D6174726978206D617472697820636F6E6361746D6174726978206475700A2020202020202F636169726F5F666F6E745F6D617472697820657863682064656620647570203420676574206578636820352067657420636169726F5F73746F72655F706F696E740A2020202020202F636169726F5F666F6E74207768657265207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F546D207B203220636F70792038203220726F6C6C2036206172726179206173746F7265202F636169726F5F666F6E745F6D61747269782065786368206465660A202020202020636169726F5F73746F72655F706F696E74202F636169726F5F666F6E74207768657265207B20706F7020636169726F5F73656C656374666F6E74207D206966207D2062696E64206465660A2F67207B2073657467726179207D2062696E64206465660A2F7267207B20736574726762636F6C6F72207D2062696E64206465660A2F6431207B207365746361636865646576696365207D2062696E64206465660A2F636169726F5F7365745F706167655F73697A65207B0A202025204368616E67652070617065722073697A652C20627574206F6E6C7920696620646966666572656E742066726F6D2070726576696F75732070617065722073697A65206F74686572776973650A202025206475706C6578206661696C732E20504C524D20737065636966696573206120746F6C6572616E6365206F66203520707473207768656E206D61746368696E672070617065722073697A650A20202520736F20776520757365207468652073616D65207768656E20636865636B696E67206966207468652073697A65206368616E6765732E0A20202F73657470616765646576696365207768657265207B0A20202020706F702063757272656E74706167656465766963650A202020202F5061676553697A65206B6E6F776E207B0A2020202020203220636F70790A20202020202063757272656E7470616765646576696365202F5061676553697A652067657420616C6F616420706F700A202020202020657863682034203120726F6C6C0A2020202020207375622061627320352067740A20202020202033203120726F6C6C0A2020202020207375622061627320352067740A2020202020206F720A202020207D207B0A202020202020747275650A202020207D206966656C73650A202020207B0A20202020202032206172726179206173746F72650A20202020202032206469637420626567696E0A20202020202020202F5061676553697A652065786368206465660A20202020202020202F496D6167696E6742426F78206E756C6C206465660A20202020202063757272656E746469637420656E640A202020202020736574706167656465766963650A202020207D207B0A202020202020706F7020706F700A202020207D206966656C73650A20207D207B0A20202020706F700A20207D206966656C73650A7D206465660A2525456E6450726F6C6F670A2525426567696E53657475700A2525426567696E5265736F757263653A20666F6E742044656A61567553616E730A3131206469637420626567696E0A2F466F6E7454797065203432206465660A2F466F6E744E616D65202F44656A61567553616E73206465660A2F5061696E74547970652030206465660A2F466F6E744D6174726978205B203120302030203120302030205D206465660A2F466F6E7442426F78205B2030203020302030205D206465660A2F456E636F64696E6720323536206172726179206465660A30203120323535207B20456E636F64696E672065786368202F2E6E6F7464656620707574207D20666F720A456E636F64696E67203332202F7370616365207075740A456E636F64696E67203438202F7A65726F207075740A456E636F64696E67203439202F6F6E65207075740A456E636F64696E67203530202F74776F207075740A456E636F64696E67203531202F7468726565207075740A456E636F64696E67203532202F666F7572207075740A456E636F64696E67203533202F66697665207075740A456E636F64696E67203534202F736978207075740A456E636F64696E67203535202F736576656E207075740A456E636F64696E67203536202F6569676874207075740A456E636F64696E67203637202F43207075740A456E636F64696E67203937202F61207075740A456E636F64696E67203939202F63207075740A456E636F64696E6720313031202F65207075740A456E636F64696E6720313035202F69207075740A456E636F64696E6720313038202F6C207075740A456E636F64696E6720313039202F6D207075740A456E636F64696E6720313131202F6F207075740A456E636F64696E6720313132202F70207075740A456E636F64696E6720313136202F74207075740A456E636F64696E6720313230202F78207075740A456E636F64696E6720313231202F79207075740A2F43686172537472696E677320323320646963742064757020626567696E0A2F2E6E6F746465662030206465660A2F7A65726F2031206465660A2F6F6E652032206465660A2F74776F2033206465660A2F74687265652034206465660A2F666F75722035206465660A2F666976652036206465660A2F7369782037206465660A2F736576656E2038206465660A2F65696768742039206465660A2F43203130206465660A2F79203131206465660A2F63203132206465660A2F6C203133206465660A2F6F203134206465660A2F6D203135206465660A2F61203136206465660A2F74203137206465660A2F69203138206465660A2F7370616365203139206465660A2F70203230206465660A2F65203231206465660A2F78203232206465660A656E6420726561646F6E6C79206465660A2F73666E7473205B0A3C303030313030303030303039303038303030303330303130363337363734323030303639316433393030303031313030303030303031666536363730363736643731333437363661303030300A313330303030303030306162363736633739363663666135346638323030303030303963303030303130363436383635363136343064313362653336303030303133616330303030303033360A363836383635363130643966303738343030303031336534303030303030323436383664373437383662633730626161303030303134303830303030303035633663366636333631303030300A626565343030303031343634303030303030363036643631373837303034383430363731303030303134633430303030303032303730373236353730336230376631303030303030313465340A303030303035363830303032303036366665393630343636303561343030303330303037303031613430306330346662303030366662303130383035376630323034303032666334643465630A333130303130643465636434656333303133313132313131323532313131323136363034303066633733303331626663653566653936303730656638663237323036323930303032303038370A666665333034386630356630303030623030313730303233343031333036613031323030613030633931313238633138303931633066316530333163313531623138313066636563663465630A333130303130653466346563313065653330303132323032313131303132333333323132313131303032323733323030313131303030323332323030313131303030303238623963396439640A396339643964396439646662303130396665663766626662666566373031303930353530666563646665636366656364666563643031333330313333303133343031333361306665373366650A383666653837666537333031386430313739303137613031386430303030303130306531303030303034356130356435303030613030343034303135343230336130303430326130303538310A303730306130303930383166303631633033303031663031306231306434346262303066353435386239303030313030343033383539656363346663656333313030326665633332663465630A643465633330346235333538353932323031623430663033306630343032356433373231313130353335323533333131323131353231666530313461666539393031363563613031346166630A613461613034373334386238343866616435616130303030303030313030393630303030303434613035663030303163303039653430323731393161316230333138316331313035303430300A313130353035303434323130613131313934306461303134393130343030613030323030313030613032303130613163313731303033303631643130666334626230313535343462623031360A353435623462623031343534356235386239303030336666633033383539633464346563633063303131313233393331303032666563333266346563663465633330346235333538303731300A303565643037303565643031623031633130313131373339353932323031343033323535303435363035353630373761303437613035373631623837313930373034303030343139303431610A303431623035316337343030373630363735316137333162373431633832303038363139383231613832316238323163613830306138316231313564303035643235323131353231333533360A303033373365303133353334323632333232303630373335336530313333333230343135313430363037303630303031383930326331666334633733303138643333363134646137383635660A643337383761643435386538303131343435356231396665663461616161616137373031393133613664393734393737393634323433636333313332653863323563613537303164666565620A303030303030303130303963666665333034373330356630303032383030373034303265303031353133306138363039316638363230313361303135306461303039393330363163613032300A393332333931303638633135613332393136316331333030303331343139316332363230313031633033313431663039303632393130666334626230313635343462623031343534356235380A623930303039666663303338353963346334643465636634656331313137333933393331303031306563653466346534656331306536656531306565313065653130656531313132333933300A303134303039363431653631316636313230363432313034303035643031316530313135313430343231323232363237333531653031333333323336333533343236326230313335333333320A333633353334323632333232303630373335336530313333333230343135313430363033336639316133666564306665653835656337366135346338366462656337623961356165623639350A396561333938353362653732373363393539653630313063386530333235316663343930646466323235323563333331333239363866383439356136373737303733376232343236623432300A323064316232376361623030303030323030363430303030303461343035643530303032303030643030383134303164303130643033306430303033303330643432303030333062303761300A303530313033383130393031306330613030316330363038303430633065313064633462623030623534346262303064353435623538623930303063666663303338353964343363633465630A333231313339333130303266653464343363656333323132333933303462353335383037313030346339303731303035633935393232303134303261306230303261303034383030353930300A363930303737303038613030303731363031326230303236303132623033333630313465303134663063346630643536303136363031373530313761303338353031306435643030356430390A303132313033333331313333313532333131323331313231333530333036666530323031666533356665643564356339666435653035323566636533303363646663333361386665613030310A363063333030303030303031303039656666653330343634303564353030316430303565343032333034316130373131383631303164316161303037313461303130383930643032613030300A383130643863303761343165313731633031306130333163303030613130303631653130666330313462623031363534346262303134353435623538623930303130666663303338353934620A623030663534353862393030313030303430333835396334643465633130633465653331303031306534653466346563313065366565313066656334313065653131313233393330313332310A313532313131336530313333333230303135313430303231323232363237333531653031333333323336333533343236323332323036303764643033313966646130326335383263666130310A323466656434666565663565633336383561633036626164636163616164353161313534303564356161666539323066306666656565656166316665663532303230636233313330623639630A396362363234323630303030303030323030386666666533303439363035663030303062303032343030353834303234313330363030306438363063303061303136303661303163313661350A313061303063383932323931316338633235306332323039316331393165313331633033323131663162323531306663656365636634656365343331303031306534663465346663653431300A656531306565313065653131313233393330343031346362303063623031636430326364303363643034636230356362303630376134316562323165303235643031356430313232303631350A313431363333333233363335333432363031313532653031323332323032303333653031333333323030313531343030323332303030313131303030323133323136303261343838396639660A383838383966396630313039346339623463633864333066336262323662653130313035666566306532666566646665656530313530303131623463396230333362626161326131626262620A613161326261303237396238323432366665663266656566353735646665656665626536666565613031386430313739303136323031613531653030303030303030303130306138303030300A303436383035643530303036303036333430313830353131303230333032303331313034303530343432303561303030383130333035303330313034303130303036303731306663636363340A313133393339333130303266663465633330346235333538303731303035656430373130303565643539323230313462623031363534353862643030303730303430303030313030303730300A303766666330333831313337333835393430313235383032303130363033316130353339303534383035363730336230303062303036303735643030356431333231313530313233303132310A613830336330666465326433303166656664333330356435353666613831303532623030303030303030303330303862666665333034386230356630303030623030323330303266303034330A343032353138306330306130323730366130316532646130313239313165386332376133333031383063323432613163313532343163306630393163313531623165303331633066323131620A333031306663633465636634633465633130656531306565313133393339333130303130656365346634656331306565313065653339333933303031323230363135313431363333333233360A333533343236323532653031333533343234333333323136313531343036303731653031313531343034323332323234333533343336313331343136333333323336333533343236323332320A303630323862393061356135393039306136613566656135383239313030666664656466666539313831393261336665663766376637666566376134343839313833383239333933383238330A393130326335396138373837396139623836383739613536323062323830623364306430623338306232323032326336386664396538653864393866633630313631373438323832373437340A383238323030303030303031303037336666653330353237303566303030313930303336343031613064613130656165306139353131303161313030616530343935313739313131386331610A303731393064303033303134313031613130666365633332656333313030313065346634656366346563313065656636656533306234306631623166316230323031356430313135326530310A323332303030313131303030323133323336333731353065303132333230303031313130303032313332313630353237363665373832666630306665663030313130303130303832653736360A366165643834666561646665376130313836303135333836656430353632643535663565666563376665643866656439666563373565356664333438343830313966303136373031363830310A396634373030303030303031303033646665353630343766303436303030306630313862343034333037303830323039313130303066306131313062306130303030306630653131306630300A306630643131306330643030303030663064313130653064306130623061306331313062306230613432306430623039313030303062303538373033626430653062626331303065306430630A306130393036303330303038306630343066306231303130643434626230306135343462623030383534356235386239303030623030343033383539346262303134353435386239303030620A666663303338353963346334313131373339333130303130653433326634656331313339313133393132333933303462353335383037313030356564303731303038656430373130303865640A303731303035656430373130303865643037303565643137333235393232303134306630303630303035303830363039303330643136306131373064313030643233306433353064343930610A346630613465306435613039356130613661306138373064383030643933306431323061303030613039303630623035306330623065306230663137303131353032313030343130303531370A306131343062313430633161306531613066323730303234303132343032323030343230303532393038323830393235306132343062323430633237306432613065326130663230313133370A303033353031333530323330303433303035333830613336306233363063333830643339306533393066333031313431303034303031343030323430303334303034343030353430303634300A303734303038343230393435306134373064343930653439306634303131353430303531303135313032353530333530303435303035353630363535303735363038353730393537306135350A306235353063353930653539306635303131363630313636303236383061363930653639306636303131376230383738306537383066383930303861303938353062383530633839306438390A306538393066393930393935306239353063396130653961306661343062613430636162306561623066623031316366313164663131666631313635356430303564303530653031326230310A333533333332333633663031303133333039303133333032393334653934376339333663346335343333323166653362633330313565303135656333363863383761396134383836353430340A346566633934303336633030303030303030303130303731666665333033653730343762303031393030336634303162303038363031383830343065383630643838306162393131303462390A313762383131386331613037313230643030343831343435316131306663653433326563333130303130653466346563313066656634656531306635656533303430306230663162313031620A383031623930316261303162303530313564303131353265303132333232303631353134313633333332333633373135306530313233323230303131313030303231333231363033653734650A396435306233633663366233353039643465346461353564666466656436303132643031303635356132303433356163326232626533636463646533326232626161323432343031336530310A306530313132303133613233303030303030303130306331303030303031373930363134303030333030323262373030393730323031303830303436303431306663656333313030326665630A333034303064313030353430303535303035363030353730303566303035303630313564313333333131323363316238623830363134663965633030303030323030373166666533303437350A303437623030306230303137303034613430313330366239313230306239306362383132386331383039313230663531303331323135343531383130666365636634656333313030313065340A663465633130656533303430323333663139376230303762303637663037376630383766303937663061376630623762306337663064376630653766306637663130376631313762313261300A313966303139313130313564303132323036313531343136333333323336333533343236323733323030313131303030323332323030313131303030303237333934616361623935393361630A616339336630303131326665656566306631666565663031313130336466653763396339653765386338633765393963666563386665656366656564666563373031333930313133303131340A303133383030303030303031303062613030303030373164303437623030323230303561343032363036313230393138306630303036316430373135306338373164323030336238316262630A313931303037303031313066303830383036353031313038306635303163313830383161343632333130666365633332666366636663656331313132333933313030326633633363653466340A336363346563333231313132313733393330343031333330323435303234373032343930323461303234613032346266323464663234666632343039303135643031336530313333333231360A313531313233313133343236323332323036313531313233313133343236323332323036313531313233313133333135336530313333333231363034323934356330383261666265623937320A373538666136623937323737386461366239623933666230373937616162303338393763373666356532666435633032396561313963626561346664383730323965613239626266613366640A383730343630616536373632376330303030303030303032303037626666653330343264303437623030306130303235303062633430323731393166306231373039306530306139313730360A623930653131323038363166626131636239323362383131386331373063303031373033313830643039303830623166303330383134343532363130666365636363643465633332333231310A333933393331303032666334653466346663663465633130633665653130656531313339313133393132333933303430366533303164333031653330316633303230333032313330323233660A323734303164343031653430316634303230343032313430323235303164353031653530316635303230353032313530323235303237373032373835316438373165383731663837323038370A323138353232393032376130323766303237316533303165333031663330323033303231343031653430316634303230343032313530316535303166353032303530323136303165363031660A363032303630323137303165373031663730323037303231383031653830316638303230383032313138356430313564303132323036313531343136333333323336336430313337313132330A333530653031323332323236333533343336333332313335333432363233323230363037333533653031333333323136303262656466616338313666393962396238623833666263383861630A636266646662303130326137393736306236353436356265356166336630303233333636376236323733643962343239346366643831616136363631633161326264633031323766386232650A326561613237323766633030303030313030333730303030303266323035396530303133303033383430313930653035303830663033613930303131303162633038383730613062303830390A303230343030303831303132306534363134313066633363633466633363633433323339333933313030326665636634336363346563333231313339333933306232616631353031303135640A303131313231313532313131313431363362303131353233323232363335313132333335333331313031373730313762666538353462373362646264643561323837383730353965666563320A386666646130383934653961396664323032363038663031336530303030303030303032303063313030303030313739303631343030303330303037303032623430306530366265303462310A303062633032303530313038303430303436303831306663336365633332333130303266653466636563333034303062313030393430303935303039363030393730303930353031356431330A333331313233313133333135323363316238623862386238303436306662613030363134653930303030303230306261666535363034613430343762303031303030316330303365343031620A316162393030306531346239303530386238306538633031626430336263316431313132306234373137303430303038303234363164313066636563333233326634656333313030313065340A653465346634633465633130633465653330343030393630316538303165613031656530316530343031356432353131323331313333313533653031333333323030313131303032323332320A323630313334323632333232303631353134313633333332333630313733623962393361623137626363303066666666636337626231303233386137393239326137613739323932613761380A666461653036306161613634363166656263666566386665663866656263363130316562636265376537636263626537653730303030303030303032303037316666653330343766303437620A303031343030316230303730343032343030313530313039383630383838303531356139303130356239306330316262313862393132623830633863316331623135303230383135303830300A346230323132306634353163313066636563663465636334313131323339333130303130653466346563653431306565313065653130663465653131313233393330343032393366316437300A316461303164643031646630316430353366303033663031336630323366313533663162303532633037326630383266303932633061366630303666303136663032366631353666316230390A356437313031356430313135323131653031333333323336333731353065303132333230303031313130303033333332303030373265303132333232303630373034376666636232306363640A623736616337363236336430366266656634666563373031323966636532303130376238303261353838396162393065303235653561626563373334333461653261326330313338303130610A303131333031343366656464633439376234616539653030303030313030336230303030303437393034363030303062303134333430343630353131303630373036303431313033303430370A303730363034313130353034303130323031303331313032303230313062313130303031303030613131303930613031303130303061313130623061303730383037303931313038303830370A343230613037303430313034303830306266303530323061303730343031303430383030303230383036306331306434346262303061353434626230306635343562346262303130353435620A346262303131353435623538623930303036303034303338353934626230313435343538623930303036666663303338353963346434633431313137333933313030326633636563333231370A333933303462353335383037313030356564303731303038656430373130303865643037313030356564303731303035656430373130303865643037313030386564303731303035656435390A323230313430393830613034303430613161303431353061323630613364303433313061353530343537303735383061363630613736303137613034373630373734306138643034383230610A393930343966303439373037393230613930306161363031613930346166303461353037613330616130306131633061303330343035303530393061306231613033313530353135303931610A306232393033323630353235303932613062323030643361303133393033333730353334303733363039333930623330306434393033343630353435303934613062343030643539303035360A303135393032353930333537303535363036353930373536303835363039353930623530306436663064373830313766306439623031393430376162303161343037623030646366306464660A306466663064326635643030356430393032323330393031323330393031333330393031303436346665366230316161643966656261666562616439303162336665373264393031323930310A323930343630666464666664633130316238666534383032346130323136666537313031386630303031333530306238303063623030636230306331303061613030396330316136303062380A303036363030303030303731303063623030613030326232303038353030373530306238303063333031636230313839303232643030636230306136303066303030643330306161303038370A303063623033616130343030303134613030333330306362303030303030643930353032303066343031353430306234303039633031333930313134303133393037303630343030303434650A303462343034353230346238303465373034636430303337303437333034636430343630303437333031333330336132303535363035613630353536303533393033633530323132303063390A303031663030623830316466303037333030626130336539303333333033626330343434303430653030646630336364303361613030653530336161303430343030303030306362303038660A303061343030376230306238303031343031366630303766303237623032353230303866303063373035636430303961303039613030366630306362303063643031396530316433303066300A303062613031383330306435303039383033303430323438303039653031643530306331303063623030663630303833303335343032376630303030303333333032363630306433303063370A303061343030636430303866303039613030373330343030303564353031306130306665303232623030613430306234303039633030303030303632303039633030303030303164303332640A303564353035643530356435303566303030376630303762303035343030613430366238303631343037323330316433303062383030636230306136303163333031656330363933303061300A303064333033356330333731303364623031383530343233303461383034343830303866303133393031313430313339303336303030386630356435303139613036313430373233303636360A303137393034363030343630303436303034376230303963303030303032373730343630303161613030653930343630303736323030376230306335303037663032376230303030303062340A303235323035636430303636303062633030363630303737303631303030636430313362303138353033383930303866303037623030303030303164303063643037346130343266303039630A303039633030303030373764303036663030303030303666303333353030366130303666303037623030616530306232303032643033393630303866303237623030663630303833303335340A303633373035663630303866303039633034653130323636303038663031386430326636303063643033343430303239303036363034656530303733303030303134303030303936303030300A623730373036303530343033303230313030326332303130623030323235343936346230343035313538323063383539323132643263623030323235343936346230343035313538323063380A353932313264326332303130303732306230303035306230306437393230623866666666353035383034316230353539623030353163623030333235303862303034323532336531323062300A303035306230306437393230623866666666353035383034316230353539623030353163623030333235303865313264326334623530353832306230666434353434353932313264326362300A303232353435363034343264326334623533353862303032323562303032323534353434353932313231326432633435343432643263623030323235623030323235343962303035323562300A303532353439363062303230363336383230386131303861323333613861313036353361326430303030303130303030303030323565623865653365353031323566306633636635303031660A303830303030303030303030643364393061326330303030303030306433643930613263663764366663346330653539303964633030303030303038303030303030303130303030303030300A303030313030303030373664666531643030303030656665663764366661353130653539303030313030303030303030303030303030303030303030303030303030303030303137303463640A303036363035313730303837303531373030653130353137303039363035313730303963303531373030363430353137303039653035313730303866303531373030613830353137303038620A303539363030373330346263303033643034363630303731303233393030633130346535303037313037636230306261303465373030376230333233303033373032333930306331303238620A303030303035313430306261303465633030373130346263303033623030303030303030303030303030343430303030303063383030303030313338303030303032333830303030303332300A303030303033646330303030303439633030303030353734303030303036303030303030303664343030303030373663303030303039333830303030303964303030303030613063303030300A306162303030303030623734303030303063613030303030306431633030303030643663303030303064366330303030306530633030303030656530303030303130363430303031303030300A303031373033353430303262303036383030306330303032303031303030393930303038303030303034313530323136303030383030303462383032383034306666666266653033666131340A303366393235303366383332303366373936303366363065303366356665303366346665303366333235303366323065303366313936303366303235303365663861343130356566666530330A656539363033656439363033656366613033656266613033656166653033653933613033653834323033653766653033653633323033653565343533303565353936303365343861343130350A653435333033653365323266303565336661303365323266303365316665303365306665303364663332303364653134303364643936303364636665303364623132303364613764303364390A626230336438666530336436386134313035643637643033643564343437303564353764303364343437303364336432316230356433666530336432316230336431666530336430666530330A636666653033636566653033636439363033636363623165303563636665303363623165303363613332303363396665303363363835313130356336316330336335313630336334666530330A633366653033633266653033633166653033633066653033626666653033626566653033626466653033626366653033626266653033626131313033623938363235303562396665303362380A623762623035623866653033623762363564303562376262303362373830303462366235323530356236356434306666303362363430303462353235303362346665303362333936303362320A666530336231666530336230666530336166666530336165363430336164306530336163616232353035616336343033616261613132303561623235303361613132303361393861343130350A613966613033613866653033613766653033613666653033613531323033613466653033613361323065303561333332303361323065303361313634303361303861343130356130393630330A396666653033396539643063303539656665303339643063303339633962313930353963363430333962396131303035396231393033396131303033393930613033393866653033393739360A306430353937666530333936306430333935386134313035393539363033393439333065303539343238303339333065303339326661303339313930626230353931666530333930386635640A303539306262303339303830303438663865323530353866356430333866343030343865323530333864666530333863386232653035386366653033386232653033386138363235303538610A343130333839383830623035383931343033383830623033383738363235303538373634303338363835313130353836323530333835313130333834666530333833383231313035383366650A303338323131303338316665303338306665303337666665303334306666376537643764303537656665303337643764303337633634303337623534313530353762323530333761666530330A373966653033373830653033373730633033373630613033373566653033373466613033373366613033373266613033373166613033373066653033366666653033366566653033366332310A303336626665303336613131343230353661353330333639666530333638376430333637313134323035363666653033363566653033363466653033363366653033363266653033363133610A303336306661303335653063303335646665303335626665303335616665303335393538306130353539666130333538306130333537313631393035353733323033353666653033353535340A313530353535343230333534313530333533303131303035353331383033353231343033353134613133303535316665303335303062303334666665303334653464313030353465666530330A346431303033346366653033346234613133303534626665303334613439313030353461313330333439316430643035343931303033343830643033343766653033343639363033343539360A303334346665303334333032326430353433666130333432626230333431346230333430666530333366666530333365336431323035336531343033336433633066303533643132303333630A336230643035336334306666306630333362306430333361666530333339666530333338333731343035333866613033333733363130303533373134303333363335306230353336313030330A333530623033333431653033333330643033333233313062303533326665303333313062303333303266306230353330306430333266306230333265326430393035326531303033326430390A303332633332303332623261323530353262363430333261323931323035326132353033323931323033323832373235303532383431303332373235303332363235306230353236306630330A323530623033323466653033323366653033323230663033323130313130303532313132303332303634303331666661303331653164306430353165363430333164306430333163313134320A303531636665303331626661303331613432303331393131343230353139666530333138363430333137313631393035313766653033313630313130303531363139303331356665303331340A666530333133666530333132313134323035313266653033313130323264303531313432303331303764303330663634303330656665303330643063313630353064666530333063303131300A303530633136303330626665303330613130303330396665303330383032326430353038666530333037313430333036363430333034303131303035303466653033343031353033303232640A303530336665303330323031313030353032326430333031313030333030666530333031623830313634383538643031326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326230300A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232623262326232620A32623262326232623262316430303E0A5D206465660A2F662D302D302063757272656E746469637420656E6420646566696E65666F6E7420706F700A2525456E645265736F757263650A2525456E6453657475700A2525506167653A203120310A2525426567696E5061676553657475700A2525506167654D656469613A203130317837346D6D0A252550616765426F756E64696E67426F783A2030202D3120323838203231310A3238382032313120636169726F5F7365745F706167655F73697A650A2525456E645061676553657475700A712030202D3120323838203231322072656374636C697020710A5120710A30203231302E373520323837202D3231302E37352072652057206E0A3120670A302E3235203231302E35203238362E3735202D3231302E323520726520660A5120710A30203231302E3735203238372E3235202D3231302E37352072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D20302E3235203231302E35203238362E3735202D3231302E323520726520530A5120710A32382033352E37352036202D302E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2032382E3734322033352E343639206D2033332E3334382033352E343639206C20680A32382E3734322033352E343639206D20530A5120710A3430203138342E37352035202D3134392E3238312072652057206E0A3020670A34302E323632203138332E38333620342E363039202D3134382E33363720726520660A5120710A3430203138342E37352036202D3134392E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2034302E323632203138332E38333620342E363039202D3134382E33363720726520530A5120710A3531203130352E37352036202D37302E3238312072652057206E0A3020670A35312E373831203130352E33323820342E363039202D36392E38353920726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2035312E373831203130352E33323820342E363039202D36392E38353920726520530A5120710A36332036302E37352035202D32352E3238312072652057206E0A3020670A36332E3330352036302E30383620342E363039202D32342E36313720726520660A5120710A36332036302E37352036202D32352E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2036332E3330352036302E30383620342E363039202D32342E36313720726520530A5120710A37342034352E37352036202D31302E3238312072652057206E0A3020670A37342E3832342034342E37383120342E363039202D392E33313220726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2037342E3832342034342E37383120342E363039202D392E33313220726520530A5120710A38362034302E37352035202D352E3238312072652057206E0A3020670A38362E3334382034302E31323520342E363035202D342E36353620726520660A5120710A38362034302E37352036202D352E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2038362E3334382034302E31323520342E363035202D342E36353620726520530A5120710A39372034312E37352036202D362E3238312072652057206E0A3020670A39372E3836372034302E37383920342E363039202D352E333220726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2039372E3836372034302E37383920342E363039202D352E333220726520530A5120710A3130392033382E37352035202D332E3238312072652057206E0A3020670A3130392E3338372033382E31323920342E363039202D322E363620726520660A5120710A3130392033382E37352036202D332E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203130392E3338372033382E31323920342E363039202D322E363620726520530A5120710A3132302033372E37352036202D322E3238312072652057206E0A3020670A3132302E39312033362E38303120342E363035202D312E33333220726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203132302E39312033362E38303120342E363035202D312E33333220726520530A5120710A3133322033372E37352036202D322E3238312072652057206E0A3020670A3133322E34332033372E34363520342E363039202D312E39393620726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203133322E34332033372E34363520342E363039202D312E39393620726520530A5120710A3134332033352E37352036202D302E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203134332E3934392033352E343639206D203134382E3535392033352E343639206C20680A3134332E3934392033352E343639206D20530A5120710A3135352033372E37352036202D322E3238312072652057206E0A3020670A3135352E3437332033362E38303120342E363039202D312E33333220726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203135352E3437332033362E38303120342E363039202D312E33333220726520530A5120710A3136362033352E37352036202D302E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203136362E3939322033352E343639206D203137312E3630322033352E343639206C20680A3136362E3939322033352E343639206D20530A5120710A3137382033362E37352036202D312E3238312072652057206E0A3020670A3137382E3531362033362E31333320342E363035202D302E36363420726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203137382E3531362033362E31333320342E363035202D302E36363420726520530A5120710A3138392033352E37352036202D302E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203139302E3033352033352E343639206D203139342E3634352033352E343639206C20680A3139302E3033352033352E343639206D20530A5120710A3230312033362E37352036202D312E3238312072652057206E0A3020670A3230312E3535352033362E31333320342E363039202D302E36363420726520660A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203230312E3535352033362E31333320342E363039202D302E36363420726520530A5120710A3231332033362E37352035202D312E3238312072652057206E0A3020670A3231332E3037382033362E31333320342E363035202D302E36363420726520660A5120710A3231322033362E37352036202D312E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203231332E3037382033362E31333320342E363035202D302E36363420726520530A5120710A3232342033352E37352036202D302E3238312072652057206E0A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D203232342E3539382033352E343639206D203232392E3230372033352E343639206C20680A3232342E3539382033352E343639206D20530A5120710A3020670A302E3520770A31204A0A31206A0A5B5D20302E3020640A3130204D2032352E3238352033352E343639206D203233322E3636342033352E343639206C2032352E3238352033312E323139206D2032352E3238352033352E343639206C2033362E3830350A2033312E323139206D2033362E3830352033352E343639206C2034382E3332382033312E323139206D2034382E3332382033352E343639206C2035392E3834382033312E323139200A6D2035392E3834382033352E343639206C2037312E3336372033312E323139206D2037312E3336372033352E343639206C2038322E3839312033312E323139206D2038322E3839310A2033352E343639206C2039342E34312033312E323139206D2039342E34312033352E343639206C203130352E39332033312E323139206D203130352E39332033352E343639206C200A3131372E3435332033312E323139206D203131372E3435332033352E343639206C203132382E3937332033312E323139206D203132382E3937332033352E343639206C203134302E3439360A2033312E323139206D203134302E3439362033352E343639206C203135322E3031362033312E323139206D203135322E3031362033352E343639206C203136332E3533352033312E3231390A206D203136332E3533352033352E343639206C203137352E3035392033312E323139206D203137352E3035392033352E343639206C203138362E3537382033312E323139206D203138362E3537380A2033352E343639206C203139382E3039382033312E323139206D203139382E3039382033352E343639206C203230392E3632312033312E323139206D203230392E3632312033352E3436390A206C203232312E3134312033312E323139206D203232312E3134312033352E343639206C203233322E3636342033312E323139206D203233322E3636342033352E343639206C20530A42540A382030203020382032382E32352032322E33323033313220546D0A2F662D302D3020312054660A5B2830292D31393236283130292D31363038283230292D31363038283330292D31363038283430292D31363037283530292D31363038283630295D544A0A31392E383433373520302054640A5B283730292D31363038283830295D544A0A3130203020302031302037312E32313438343420362E39303133363720546D0A5B284379636C6F6D6174696320436F6D706C652931382878697479295D544A0A45540A32352E3238352033352E343639206D2032352E323835203230312E383031206C2032312E3033352033352E343639206D2032352E3238352033352E343639206C2032312E3033350A2036382E373334206D2032352E3238352036382E373334206C2032312E30333520313032206D2032352E32383520313032206C2032312E303335203133352E3237206D2032352E3238350A203133352E3237206C2032312E303335203136382E353335206D2032352E323835203136382E353335206C2032312E303335203230312E383031206D2032352E323835203230312E3830310A206C20530A42540A382030203020382031332E3937323635362033322E39343932313920546D0A2F662D302D3020312054660A283029546A0A2D302E363336323320342E3135383230332054640A28353029546A0A2D302E363336323320342E3135383230332054640A2831303029546A0A3020342E3135383639312054640A2831353029546A0A3020342E3135383230332054640A2832303029546A0A3020342E3135383230332054640A2832353029546A0A45540A5120510A73686F77706167650A2525547261696C65720A2525454F460A>|ps>|271pt|||>|<label|linux-cc>Histogram
  of the Cyclomatic Complexity Distribution of the Linux TCP Functions>

  In figure <reference|linux-cc> the width of each histogram bin (and
  starting point, etc.) is exactly the same as in the LWIP cc histogram
  (figure <reference|lwip-cc>)

  These results tell us:

  <\enumerate>
    <item>The CC distribution is very similar to the LWIP CC distribution

    <item>Most functions (328 of 408) lie in the sweet spot of CC
    <math|\<in\><around*|[|0,10|]>>

    <item>There are a few black sheep

    <item>And 3 very black sheep (the very small bars between 60 and 80,
    barely visible). But

    <\enumerate>
      <item>These 3 are less black than the very black sheep of LWIP
      (63,71,78 instead of 104)

      <item>Linux TCP is comprised of 408 functions, LWIP TCP of 79. Which is
      roughly 5 to 1. So while Linux TCP contains 5 times the functions LWIP
      contains, it only contains 3 times the \Pvery black sheep\Q LWIP
      contains. So Linux TCP has \Ppercentile less black sheep\Q.
    </enumerate>
  </enumerate>

  To summarise regarding cyclomatic complexity Linux scores comparable to
  LWIP but has its worst functions scoring better than the worst functions of
  LWIP.

  <subsection|Comment Density>

  Since LWIP TCP contains Doxygen Comments for every function and Linux does
  this for a few we decided that only comparing overall comment lines would
  be unfair. Therefore we added a second sub-study comparing the amounts of
  function internal comments.

  <subsubsection|In Function Comments>

  Another common measurement for Code Quality is comment density, the
  quotient of comment chars vs. statements <cite|Spi08b>. While it's quite
  difficult to quantify and measure the quality of comments, it's quite
  simple to measure their existence and frequency.\ 

  While we studied the comment density we realised that it's value vary
  significantly. These variations depend on function length in LOC. A lot of
  short functions contain no comments at all, which is not really bad from a
  code quality point of view. The inner workings of short functions like
  <verbatim|tcp_setprio()> (figure <reference|tcp_setprio>) are
  understandable without a comment.

  <\big-figure>
    <\code>
      void

      tcp_setprio(struct tcp_pcb *pcb, u8_t prio)

      {

      \ \ pcb-\<gtr\>prio = prio;

      }\ 
    </code>
  </big-figure|<label|tcp_setprio>tcp_setprio() in LWIP tcp.c>

  Some further semantics of the internal comment density:\ 

  <\enumerate>
    <item>In general LWIP scores better here containing more inline comment
    characters than Linux

    <item>The plottings indicate a loose constant comment density with lots
    of outliers. Since they did not contain any more interesting information
    we chose to omit them.

    <item>Linux includes some bad examples of over 100 lines with no or
    almost no comments.

    <item>In Linux TCP the comment density is varying more significantly.
  </enumerate>

  <subsubsection|In Function Comments and Function Descriptions (All
  Comments)>

  A summarising measurement over all functions in all files gives the
  following results:

  <big-table|<tabular|<tformat|<table|<row|<cell|<block*|<tformat|<cwith|4|4|1|1|cell-hyphen|n>|<table|<row|<cell|>|<cell|Linux
  TCP>|<cell|LWIP TCP>>|<row|<cell|Comments per
  Function>|<cell|2.52>|<cell|8.70>>|<row|<cell|Doxygen Comments per
  Function>|<cell|0.026>|<cell|1.12>>|<row|<\cell>
    Average Comment Length

    (Chars/Comment)\ 
  </cell>|<cell|149.8>|<cell|99.9>>>>>>>>>>|Overall Comment Density
  Statistics>

  This indicates several results:

  <\enumerate>
    <item>LWIP has a very good Doxygen coverage covering every single
    function<\footnote>
      We verified this manually by looking through the LWIP code and could
      not find a single function without a Doxygen comment.
    </footnote>, some have even two Doxygen comments. Linux has its own
    Doxygen like system<\footnote>
      It's called kernel-doc. It consists of Doxygen like comments above
      functions which are processed by a Perl script for further usage in man
      pages or other documentation.
    </footnote> but scores quite bad here.

    <item>In general LWIP contains more but shorter comments per function.
    While this may be subjective we assume that many short comments are
    better for comprehension than a few long once.
  </enumerate>

  In summary the LWIP TCP implementation contains better documentation than
  Linux TCP. This result hardens if you compare the comprehensive Doxygen
  documentation and the wiki (containing additional conceptual documents) to
  the few conceptual files in the Linux <verbatim|Documentation> folder, or
  the Linux auto generated restructured Text Documentation.<\footnote>
    The Linux auto-generated documentation (via <verbatim|make htmldocs> for
    example), like the LWIP documentation contains some additional info on
    TCP, but way less.
  </footnote>

  <section|A Short Qualitative Evaluation of the Header Files>

  A short manual evaluation of the header files revealed that they are of
  good quality in both projects. Function prototypes were noted consistently
  in both projects. Regarding data structure definitions LWIP and Linux score
  comparably good. Every strict member has a short comment explaining its
  meaning in both projects.

  <section|Lines of Code and Cyclomatic Complexity - A Correlation?>

  You may have realised too, if you look at the previous histograms for
  function length and cyclomatic complexity of one implementation, they look
  pretty similar. Almost like this two parameters were somehow related or
  correlated.\ 

  This suspicion hardened when we where looking at the raw data set in our
  spreadsheet software, suggesting many examples of correlation. Especially
  when we sorted the functions, first by Lines of Code, then by cyclomatic
  complexity, the order was almost the same only, a few entries changed
  places. Also functions with low CC also were always very short, as well as
  all long function had a CC.

  Finally, the data hardening this suspicion was so much, so we decided to
  look if someone else has already looked into this correlation. And we were
  successful:

  In 2009 <name|Jay, Hale,> and <name|Smith> measured about 1,2 Million
  source code files and created comprehensive evidence and proved it: There
  is a stable linear relationship between cyclomatic complexity and lines of
  code. They also go one step further by concluding:<cite|graylin2009cyclomatic>

  <\verbatim>
    We conclude that CC has no explanatory power of its own and that LOC and
    CC \ 

    measure the same property.
  </verbatim>

  Which is a very practical and way to little known fact worth spreading.
  Knowing this simplifies code quality analysis, since obtaining the length
  of functions is way easier than obtaining the cyclomatic complexity. For a
  small code base this way a estimation is possible even without using any
  specialised tools.

  \;

  \;

  <chapter|A short Discussion of Data Structures>

  In our last chapter let's take a look at one of the central data structures
  of every tcp implementation (and every network stack): the data structure
  for a packet.

  <section|The LWIP Packet Data Structure (PBUF)>

  The LWIP packet data structure is the <verbatim|pbuf>, packet buffer. It's
  surprisingly simple and contains only 7 members. It's also well documented
  as visible in figure <reference|lwip-pbuf-def>.

  <\big-figure>
    <\cpp-code>
      /** Main packet buffer struct */

      struct pbuf {

      \ \ /** next pbuf in singly linked pbuf chain */

      \ \ struct pbuf *next;

      \;

      \ \ /** pointer to the actual data in the buffer */

      \ \ void *payload;

      \;

      \ \ /**

      \ \ \ * total length of this buffer and all next buffers in chain

      \ \ \ * belonging to the same packet.

      \ \ \ *

      \ \ \ * For non-queue packet chains this is the invariant:

      \ \ \ * p-\<gtr\>tot_len == p-\<gtr\>len + (p-\<gtr\>next?
      p-\<gtr\>next-\<gtr\>tot_len: 0)

      \ \ \ */

      \ \ u16_t tot_len;

      \;

      \ \ /** length of this buffer */

      \ \ u16_t len;

      \;

      \ \ /** pbuf_type as u8_t instead of enum to save space */

      \ \ u8_t /*pbuf_type*/ type;

      \;

      \ \ /** misc flags */

      \ \ u8_t flags;

      \;

      \ \ /**

      \ \ \ * the reference count always equals the number of pointers

      \ \ \ * that refer to this pbuf. This can be pointers from an
      application,

      \ \ \ * the stack itself, or pbuf-\<gtr\>next pointers from a chain.

      \ \ \ */

      \ \ u16_t ref;

      };\ 
    </cpp-code>
  </big-figure|<label|lwip-pbuf-def>The Definition of the LWIP PBUF structure
  in <verbatim|include/lwip/pbuf.h>>

  Some explanations:

  <\enumerate>
    <item>One network packet can be stored in several <verbatim|pbuf>s, which
    then are stored together in a <verbatim|pbuf chain>. A <verbatim|pbuf
    chain> is a singly linked list of <verbatim|pbufs>. This is what the
    first member the <verbatim|next> pointer is intended
    for.<cite|lwip-doxygen>

    <item><verbatim|payload> points to the actual packet data. It's type is a
    void pointer so it can easily be casted to every other type, which
    becomes necessary when parsing the data.

    <item>About data types: <verbatim|u8_t> is a 8 bit unsigned integer,
    <verbatim|u16_t> a 16 byte unsigned integer etc.

    <item>For further details of the <verbatim|pbuf> structure see the
    <verbatim|infrastructure \<gtr\> pbuf> section in the lwIP Doxygen
    documentation<cite|lwip-doxygen>
  </enumerate>

  Besides the struct definition there are also the prototypes of several
  <verbatim|pbuf> accessor function listed in <verbatim|pbuf.h>, giving this
  data structure an nice encapsulated API. Since they have descriptive
  signatures like:

  <\itemize>
    <item><verbatim|struct pbuf *pbuf_alloc(pbuf_layer l, u16_t length,
    pbuf_type type);>

    <item><verbatim|err_t pbuf_copy(struct pbuf *p_to, const struct pbuf
    *p_from);>
  </itemize>

  we decided to not describe them any further. In addition all
  <verbatim|pbuf> API functions are well documented in the LWIP Doxygen
  documentation<cite|lwip-doxygen>.

  <section|The Linux Packet Data Structure (SKB)>

  The naming for the Linux packet data structure is a bit confusing:

  <\enumerate>
    <item>In prose texts it's called <verbatim|Socket Buffer>

    <item>The C datatype is <verbatim|struct sk_buff>

    <item>The corresponding header file is <verbatim|skbuff.h>

    <item>All the variables referencing it are called <verbatim|skb>
  </enumerate>

  Which means we have almost every permutation of the name covered. Great! In
  this text we will stick to the name <verbatim|skb>.\ 

  Compared to the lwIP <verbatim|pbuf> the <verbatim|skb> is overwhelmingly
  complex, containing over 60 members. Since it's definition in
  <verbatim|include/linux/skbuff.h> is over 150 lines long we decided to not
  print it here, but in a special Appendix, Appendix
  <reference|skb-appendix>.

  Some explanations:

  <\enumerate>
    <item>In every place where <verbatim|skb>s get stored and handled (like
    the input/output queues of sockets or NIC drivers), they are handled as
    double linked list.<cite|rosen2013linux>

    This is why there are the <verbatim|*next> and <verbatim|*previous>
    pointers it the beginning of the data structure.\ 

    It is interesting to note that the kernel has a own double linked list
    data structure, \ which every \Pthings-which-wants-to-be-in-a-list\Q
    should use according to convention<cite|love2010linux>, but
    <verbatim|skb>s don't. This is perhaps because <verbatim|skb>s are way
    older than this new official data type.

    <item><verbatim|skb> also contains function pointers like <verbatim|void
    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (*destructor)(struct sk_buff *skb)>
    which lift this data structure in a entire new complexity range, not only
    containing data definitions but also pointers to variable logic.

    <item><verbatim|skb> also contains a lot more information about internal
    packet structure. This includes information about protocol headers
    (transport and network protocol headers) or VLAN headers. Regarding this
    <verbatim|skb> uses a completely different approach than LWIP, which only
    contains an opaque <verbatim|payload> void pointer.
  </enumerate>

  Regarding accessor functions <verbatim|skb> is comparable to
  <verbatim|pbuf>.

  <section|Comparative Thoughts>

  Our comparison starts with some quantitative data, shown in table
  <reference|data-structure-statistics>.<\footnote>
    The Linux memory size is approximated by counting the members sizes and
    assuming a Intel 64 bit CPU and the gcc type sizes. Where conditional
    compilation was relevant we decided to include 50 % of the ifdef guarded
    members. For LWIP counting was way simpler since most of the 7 members
    had hard-coded size.
  </footnote>

  <big-table|<block|<tformat|<cwith|3|3|1|1|cell-hyphen|n>|<table|<row|<cell|>|<cell|LWIP
  TCP>|<cell|Linux TCP>>|<row|<cell|Members>|<cell|7>|<cell|\<gtr\>60>>|<row|<\cell>
    Approximate Memory Size

    (Assuming a 64 bit CPU for Linux)
  </cell>|<cell|64 bit + 2 pointers>|<cell|1000 bit + 7
  pointers>>|<row|<cell|Contains packet payload>|<cell|no>|<cell|no>>|<row|<cell|Contains
  pointers to net device and socket>|<cell|no>|<cell|yes>>|<row|<cell|Contains
  list handling pointers>|<cell|yes>|<cell|yes>>|<row|<cell|Contains packet
  structure info>|<cell|no>|<cell|yes>>|<row|<cell|Contained function
  pointers>|<cell|0>|<cell|3>>>>>|<label|data-structure-statistics>Quantitative
  Data on the Packet Data Structures>

  As we see in table <reference|data-structure-statistics> the <verbatim|skb>
  data structure is way larger than the <verbatim|pbuf>, in terms of member
  count as well in term of memory size. While the difference of about 1000
  bit to 64 bit seems extreme you should take a closer look at the members.
  Many of the <verbatim|skb> members are necessary like the \Ptimestamp\Q,
  queuing infos, VLAN tags, or the checksum. So while some of this members
  are only a result of Linux TCP having more features than lwIP TCP, a lot of
  them is data lwIP has to store somewhere too. Having them elsewhere does
  not really save memory at run-time at all, it only means storing them
  elsewhere, like in the payload or in some separate (maybe global)
  variables. So this memory difference isn't as extreme as it seems.

  Having all this related infos as separate members of the struct is also a
  good thing in terms of software architecture. It means having a clear and
  comfortable abstraction and data type. While having these infos in external
  variables is a leaky abstraction. Since this can totally make sense when
  working single threaded and being lightweight, this may be was a deliberate
  performance vs. architecture trade-off.

  Regarding Code Quality both data structures share a high standard. Both are
  well documented and formatted. The extreme length of <verbatim|skb> (over
  150 lines) could be considered a problem, but since this is a central
  highly performance relevant structure it's quite likely this is a well
  considered design decision.

  Regarding performance we should note that most Linux accessor functions are
  inline functions (and usually only 2-3 lines long), which saves some small
  function call and return overhead. The lwIP functions aren't since they
  don't use inline in their project, so this may make a small performance
  difference every time a packet is accessed, which happens often, because
  everything a network stack does is accessing and modifying packets.

  To summarise we can say that the lwIP <verbatim|pbuf> is much smaller than
  the Linux <verbatim|skb> but also less sophisticated and more of a low
  level data structure. The memory size difference should not matter that
  much, because all the data contained in the additional <verbatim|skb>
  fields has to be contained somewhere anyway. Like in external variables or
  the payload member.

  <chapter|Conclusion>

  We comprehensively covered several aspects of the two TCP implementations.
  From features and user base, directory structure and code quality to the
  data structures of the packets.

  <\description-long>
    <item*|Features>In general, Linux TCP supports way more features,
    regarding several TCP extensions of the last 10 years, lwIP doesn't. But
    the most important additional features are multi-threading and firewall
    support. Since multi-threading changes several fundamental design
    concepts this difference was visible in several other points of our
    study. The only feature of lwIP Linux TCP hasn't is portability, while
    the lwIP stack plays with several operating systems or minimal embedded
    system configurations, the Linux TCP stack only plays with the Linux
    kernel.

    <item*|User Base>Both systems have huge real wold user bases. While the
    home of lwIP is the embedded world it is used in many small devices, as
    well as cars and air planes. The linux kernel is present in over 60% of
    all smart phones, most servers and also many embedded device. So almost
    omni present. Because of the high distribution of smartphones in all
    western and many non-western countries we currently assume the Linux TCP
    stack has a larger user base, but it's very difficult to reason about
    this.

    <item*|Files and Directory Structure>Recognising and isolating the TCP
    implementation was easy for lwIP, since it consists of only three files,
    and difficult for Linux. Since the Linux TCP implementation is more
    interwoven with the rest of the network stack or contain TCP extensions
    or additional pluggable congestion control algorithms. Our final set
    contained 9 C files and 4 header files for Linux and 3 C files and 3
    header files for lwIP. We also gave a short description of the
    functionality and meaning of every file for the implementation.

    <item*|Code Quality>First we evaluated code quality metric measurement
    tools. The tooling situation here is surprisingly bad, finally we chose
    <verbatim|cqmetrics> and a own wrapper script.

    Our subsequent study revealed several results grouped by category:

    <\description>
      <item*|Code Organisation>

      In lwIP the code is well organised into subdirectories where everything
      can easily be found. This isn't the case for Linux, the
      <verbatim|ipv4/> folder contains 94 files.

      In lwIP all files are below 2100 lines which is good. In Linux 2 files
      are over 3000 Lines long which is not so good, speaking of
      modularization.

      <item*|Function Length and Complexity>

      In general both implementations score very good here with most
      functions being und 40 lines long. However both implementations
      contained black sheep, both responsible for processing incoming TCP
      packets. But while the Linux black sheep had somehow tolerable 336
      lines, the lwIP black sheep had way worse 692 Lines.

      The cyclomatic complexity (cc) graphs and results were very similar to
      the function length ones.\ 

      So we did some research and found out that in a huge recent study it
      was discovered that there is a direct linear
      correlation<space|0.2spc>between lines and cc. So in most cases it is
      not necessary to even measure cc.

      <item*|Comment Density>

      lwIP contains Doxygen comments for every single function, Linux does
      for some (2.6%). Counting this and also the in-function comments lwIP
      TCP is well documented, while Linux TCP is under documented.
    </description>

    <item*|Data Structures>The lwIP data structure for packets
    (<verbatim|pbuf>) is very small and low level style (7 members) while the
    Linux data structure (<verbatim|skb>) is quite big and more high level
    like (<math|\<gtr\>60> members). The size difference in bytes should not
    matter though, because all the data stored in the additional members of
    <verbatim|skb> has also to be stored somewhere in lwIP like in additional
    variables or the payload member.
  </description-long>

  <section|Ending Thoughts>

  After ending this work there remain several conclusions:

  <\enumerate>
    <item>About Learning TCP

    If you want to learn how to implement TCP read the lwIP source code it's
    small, neat and well documented

    <item>What did the Code Quality study unveil?

    For lwIP there is this one 692 lines function which perhaps should be
    refactored. For Linux there are several small things which could be done
    in small commits, like taking all the tcp files and putting them into one
    sub directory, or adding short describing headers to every tcp related
    file.

    <item>How helpful was the quality metrics methodology for understanding a
    new project?

    While the cyclomatic complexity was not helpful at all knowing the LOC of
    every function was. It gave a good overview over the project somehow
    telling which function is how difficult or relevant. So whereas the
    tooling for cyclomatic complexity measurement was horrible this was not
    really a problem. Since measuring the LOC of a function is not really
    difficult this could be a great addition to an IDE, including a small
    view which shows all the functions with and sorted by their lengths,
    instantly providing a better \Pfeeling\Q for a project.
  </enumerate>

  <appendix|TCP SACK Functions in tcp_input.c><label|tcp-sack-appendix>

  <\code>
    tcp_dsack_seen

    tcp_sack_cache_ok

    tcp_reset_reno_sack

    tcp_dsack_extend

    tcp_add_reno_sack

    tcp_try_undo_dsack

    tcp_sack_extend

    tcp_limit_reno_sacked

    tcp_check_sack_reneging

    tcp_sacktag_skip

    tcp_remove_reno_sacks

    tcp_maybe_skipping_dsack

    tcp_dsack_set

    tcp_sack_maybe_coalesce

    tcp_sack_remove

    tcp_check_dsack

    tcp_is_sackblock_valid

    tcp_sack_new_ofo_skb

    tcp_match_skb_to_sack

    tcp_sacktag_walk

    tcp_sacktag_one

    tcp_sacktag_write_queue
  </code>

  <appendix|The Linux Socket Buffer Data Structure><label|skb-appendix>

  <section|C Definition>

  From <verbatim|include/linux/skbuff.h>:

  <\cpp-code>
    struct sk_buff {

    \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ /* These two members must
    be first. */

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct sk_buff
    \ \ \ \ \ \ \ \ \ *next;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct sk_buff
    \ \ \ \ \ \ \ \ \ *prev;

    \;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ktime_t
    \ \ \ \ \ \ \ \ tstamp;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct
    skb_mstamp skb_mstamp;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ };

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ };

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct rb_node \ rbnode; /* used in netem
    & tcp stack */

    \ \ \ \ \ \ \ \ };

    \ \ \ \ \ \ \ \ struct sock \ \ \ \ \ \ \ \ \ \ \ \ *sk;

    \ \ \ \ \ \ \ \ struct net_device \ \ \ \ \ \ *dev;

    \;

    \ \ \ \ \ \ \ \ /*

    \ \ \ \ \ \ \ \ \ * This is the control buffer. It is free to use for
    every

    \ \ \ \ \ \ \ \ \ * layer. Please put your private variables there. If
    you

    \ \ \ \ \ \ \ \ \ * want to keep them across layers you have to do a
    skb_clone()

    \ \ \ \ \ \ \ \ \ * first. This is owned by whoever has the skb queued
    ATM.

    \ \ \ \ \ \ \ \ \ */

    \ \ \ \ \ \ \ \ char \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ cb[48]
    __aligned(8);

    \;

    \ \ \ \ \ \ \ \ unsigned long \ \ \ \ \ \ \ \ \ \ _skb_refdst;

    \ \ \ \ \ \ \ \ void \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (*destructor)(struct
    sk_buff *skb);

    #ifdef CONFIG_XFRM

    \ \ \ \ \ \ \ \ struct \ sec_path \ \ \ \ \ \ \ *sp;

    #endif

    #if defined(CONFIG_NF_CONNTRACK) \|\| defined(CONFIG_NF_CONNTRACK_MODULE)

    \ \ \ \ \ \ \ \ struct nf_conntrack \ \ \ \ *nfct;

    #endif

    #if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)

    \ \ \ \ \ \ \ \ struct nf_bridge_info \ \ *nf_bridge;

    #endif

    \ \ \ \ \ \ \ \ unsigned int \ \ \ \ \ \ \ \ \ \ \ len,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ data_len;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ mac_len,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ hdr_len;

    \;

    \ \ \ \ \ \ \ \ /* Following fields are _not_ copied in
    __copy_skb_header()

    \ \ \ \ \ \ \ \ \ * Note that queue_mapping is here mostly to fill a
    hole.

    \ \ \ \ \ \ \ \ \ */

    \ \ \ \ \ \ \ \ kmemcheck_bitfield_begin(flags1);

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ queue_mapping;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ cloned:1,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ nohdr:1,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ fclone:2,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ peeked:1,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ head_frag:1,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ xmit_more:1;

    \ \ \ \ \ \ \ \ /* one bit hole */

    \ \ \ \ \ \ \ \ kmemcheck_bitfield_end(flags1);

    \;

    \ \ \ \ \ \ \ \ /* fields enclosed in headers_start/headers_end are
    copied

    \ \ \ \ \ \ \ \ \ * using a single memcpy() in __copy_skb_header()

    \ \ \ \ \ \ \ \ \ */

    \ \ \ \ \ \ \ \ /* private: */

    \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ headers_start[0];

    \ \ \ \ \ \ \ \ /* public: */

    \;

    /* if you move pkt_type around you also must adapt those constants */

    #ifdef __BIG_ENDIAN_BITFIELD

    #define PKT_TYPE_MAX \ \ \ (7 \<less\>\<less\> 5)

    #else

    #define PKT_TYPE_MAX \ \ \ 7

    #endif

    #define PKT_TYPE_OFFSET() \ \ \ \ \ \ offsetof(struct sk_buff,
    __pkt_type_offset)

    \;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __pkt_type_offset[0];

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ pkt_type:3;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ pfmemalloc:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ignore_df:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ nfctinfo:3;

    \;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ nf_trace:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ip_summed:2;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ooo_okay:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ l4_hash:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ sw_hash:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ wifi_acked_valid:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ wifi_acked:1;

    \;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ no_fcs:1;

    \ \ \ \ \ \ \ \ /* Indicates the inner headers are valid in the skbuff.
    */

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ encapsulation:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ encap_hdr_csum:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ csum_valid:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ csum_complete_sw:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ csum_level:2;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ csum_bad:1;

    \;

    #ifdef CONFIG_IPV6_NDISC_NODETYPE

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ndisc_nodetype:2;

    #endif

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ipvs_property:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ inner_protocol_type:1;

    \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ remcsum_offload:1;

    \ \ \ \ \ \ \ \ /* 3 or 5 bit hole */

    \;

    #ifdef CONFIG_NET_SCHED

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ tc_index;
    \ \ \ \ \ \ /* traffic control index */

    #ifdef CONFIG_NET_CLS_ACT

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ tc_verd;
    \ \ \ \ \ \ \ /* traffic control verdict */

    #endif

    #endif

    \;

    \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __wsum \ \ \ \ \ \ \ \ \ csum;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ struct {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u16 \ \ csum_start;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u16 \ \ csum_offset;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ };

    \ \ \ \ \ \ \ \ };

    \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ priority;

    \ \ \ \ \ \ \ \ int \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ skb_iif;

    \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ hash;

    \ \ \ \ \ \ \ \ __be16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vlan_proto;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vlan_tci;

    #if defined(CONFIG_NET_RX_BUSY_POLL) \|\| defined(CONFIG_XPS)

    \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ unsigned int \ \ \ napi_id;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ unsigned int \ \ \ sender_cpu;

    \ \ \ \ \ \ \ \ };

    #endif

    \ \ \ \ \ \ \ \ union {

    #ifdef CONFIG_NETWORK_SECMARK

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ secmark;

    #endif

    #ifdef CONFIG_NET_SWITCHDEV

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u32
    \ \ \ \ \ \ \ \ \ \ offload_fwd_mark;

    #endif

    \ \ \ \ \ \ \ \ };

    \;

    \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ mark;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u32
    \ \ \ \ \ \ \ \ \ \ reserved_tailroom;

    \ \ \ \ \ \ \ \ };

    \;

    \ \ \ \ \ \ \ \ union {

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __be16 \ \ \ \ \ \ \ \ \ inner_protocol;

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ __u8 \ \ \ \ \ \ \ \ \ \ \ inner_ipproto;

    \ \ \ \ \ \ \ \ };

    \;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ inner_transport_header;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ inner_network_header;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ inner_mac_header;

    \;

    \ \ \ \ \ \ \ \ __be16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ protocol;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ transport_header;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ network_header;

    \ \ \ \ \ \ \ \ __u16 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ mac_header;

    \;

    \ \ \ \ \ \ \ \ /* private: */

    \ \ \ \ \ \ \ \ __u32 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ headers_end[0];

    \ \ \ \ \ \ \ \ /* public: */

    \;

    \ \ \ \ \ \ \ \ /* These elements must be at the end, see alloc_skb() for
    details. \ */

    \ \ \ \ \ \ \ \ sk_buff_data_t \ \ \ \ \ \ \ \ \ tail;

    \ \ \ \ \ \ \ \ sk_buff_data_t \ \ \ \ \ \ \ \ \ end;

    \ \ \ \ \ \ \ \ unsigned char \ \ \ \ \ \ \ \ \ \ *head,

    \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ *data;

    \ \ \ \ \ \ \ \ unsigned int \ \ \ \ \ \ \ \ \ \ \ truesize;

    \ \ \ \ \ \ \ \ atomic_t \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ users;

    };
  </cpp-code>

  <section|Struct Member Documentation>

  <\cpp-code>
    /**\ 

    \ * \ \ \ \ \ struct sk_buff - socket buffer

    \ * \ \ \ \ \ @next: Next buffer in list

    \ * \ \ \ \ \ @prev: Previous buffer in list

    \ * \ \ \ \ \ @tstamp: Time we arrived/left

    \ * \ \ \ \ \ @rbnode: RB tree node, alternative to next/prev for
    netem/tcp

    \ * \ \ \ \ \ @sk: Socket we are owned by

    \ * \ \ \ \ \ @dev: Device we arrived on/are leaving by

    \ * \ \ \ \ \ @cb: Control buffer. Free for use by every layer. Put
    private vars here

    \ * \ \ \ \ \ @_skb_refdst: destination entry (with norefcount bit)

    \ * \ \ \ \ \ @sp: the security path, used for xfrm

    \ * \ \ \ \ \ @len: Length of actual data

    \ * \ \ \ \ \ @data_len: Data length

    \ * \ \ \ \ \ @mac_len: Length of link layer header

    \ * \ \ \ \ \ @hdr_len: writable header length of cloned skb

    \ * \ \ \ \ \ @csum: Checksum (must include start/offset pair)

    \ * \ \ \ \ \ @csum_start: Offset from skb-\<gtr\>head where checksumming
    should start

    \ * \ \ \ \ \ @csum_offset: Offset from csum_start where checksum should
    be stored

    \ * \ \ \ \ \ @priority: Packet queueing priority

    \ * \ \ \ \ \ @ignore_df: allow local fragmentation

    \ * \ \ \ \ \ @cloned: Head may be cloned (check refcnt to be sure)

    \ * \ \ \ \ \ @ip_summed: Driver fed us an IP checksum

    \ * \ \ \ \ \ @nohdr: Payload reference only, must not modify header

    \ * \ \ \ \ \ @nfctinfo: Relationship of this skb to the connection

    \ * \ \ \ \ \ @pkt_type: Packet class

    \ * \ \ \ \ \ @fclone: skbuff clone status

    \ * \ \ \ \ \ @ipvs_property: skbuff is owned by ipvs

    \ * \ \ \ \ \ @peeked: this packet has been seen already, so stats have
    been

    \ * \ \ \ \ \ \ \ \ \ \ \ \ \ done for it, don't do them again

    \ * \ \ \ \ \ @nf_trace: netfilter packet trace flag

    \ * \ \ \ \ \ @protocol: Packet protocol from driver

    \ * \ \ \ \ \ @destructor: Destruct function

    \ * \ \ \ \ \ @nfct: Associated connection, if any

    \ * \ \ \ \ \ @nf_bridge: Saved data about a bridged frame - see
    br_netfilter.c

    \ * \ \ \ \ \ @skb_iif: ifindex of device we arrived on

    \ * \ \ \ \ \ @tc_index: Traffic control index

    \ * \ \ \ \ \ @tc_verd: traffic control verdict

    \ * \ \ \ \ \ @hash: the packet hash

    \ * \ \ \ \ \ @queue_mapping: Queue mapping for multiqueue devices

    \ * \ \ \ \ \ @xmit_more: More SKBs are pending for this queue

    \ * \ \ \ \ \ @ndisc_nodetype: router type (from link layer)

    \ * \ \ \ \ \ @ooo_okay: allow the mapping of a socket to a queue to be
    changed

    \ * \ \ \ \ \ @l4_hash: indicate hash is a canonical 4-tuple hash over
    transport

    \ * \ \ \ \ \ \ \ \ \ \ \ \ \ ports.

    \ * \ \ \ \ \ @sw_hash: indicates hash was computed in software stack

    \ * \ \ \ \ \ @wifi_acked_valid: wifi_acked was set

    \ * \ \ \ \ \ @wifi_acked: whether frame was acked on wifi or not

    \ * \ \ \ \ \ @no_fcs: \ Request NIC to treat last 4 bytes as Ethernet
    FCS

    \ \ * \ \ \ \ @napi_id: id of the NAPI struct this skb came from

    \ * \ \ \ \ \ @secmark: security marking

    \ * \ \ \ \ \ @offload_fwd_mark: fwding offload mark

    \ * \ \ \ \ \ @mark: Generic packet mark

    \ * \ \ \ \ \ @vlan_proto: vlan encapsulation protocol

    \ * \ \ \ \ \ @vlan_tci: vlan tag control information

    \ * \ \ \ \ \ @inner_protocol: Protocol (encapsulation)

    \ * \ \ \ \ \ @inner_transport_header: Inner transport layer header
    (encapsulation)

    \ * \ \ \ \ \ @inner_network_header: Network layer header (encapsulation)

    \ * \ \ \ \ \ @inner_mac_header: Link layer header (encapsulation)

    \ * \ \ \ \ \ @transport_header: Transport layer header

    \ * \ \ \ \ \ @network_header: Network layer header

    \ * \ \ \ \ \ @mac_header: Link layer header

    \ * \ \ \ \ \ @tail: Tail pointer

    \ * \ \ \ \ \ @end: End pointer

    \ * \ \ \ \ \ @head: Head of buffer

    \ * \ \ \ \ \ @data: Data head pointer

    \ * \ \ \ \ \ @truesize: Buffer size

    \ * \ \ \ \ \ @users: User count - see {datagram,tcp}.c

    \ */
  </cpp-code>

  <\bibliography|bib|tm-alpha|bibliography.bib>
    <\bib-list|31>
      <bibitem*|APS99><label|bib-allman.paxson.stevens_2581rfc99>M.<nbsp>Allman,
      V.<nbsp>Paxson<localize|, and >W.<nbsp>Stevens.<newblock> RFC 2581: TCP
      congestion control.<newblock> 1999.<newblock>

      <bibitem*|BCV><label|bib-baiocchi2007yeah>Andrea Baiocchi,
      Angelo<nbsp>P Castellani<localize|, and >Francesco Vacirca.<newblock>
      Yeah-tcp: yet another highspeed tcp.<newblock>

      <bibitem*|BOP94><label|bib-brakmo1994tcp>Lawrence<nbsp>S Brakmo,
      Sean<nbsp>W O'Malley<localize|, and >Larry<nbsp>L Peterson.<newblock>
      <with|font-shape|italic|TCP Vegas: New techniques for congestion
      detection and avoidance>, <localize|volume><nbsp>24.<newblock> ACM,
      1994.<newblock>

      <bibitem*|CCRJ14><label|bib-RFC7413>Y.<nbsp>Cheng, J.<nbsp>Chu,
      S.<nbsp>Radhakrishnan<localize|, and >A.<nbsp>Jain.<newblock> Tcp fast
      open.<newblock> RFC 7413, RFC Editor, December 2014.<newblock>
      <slink|http://www.rfc-editor.org/rfc/rfc7413.txt>.<newblock>

      <bibitem*|cod><label|bib-coding-style-linux>Linux kernel documentation
      on coding style.<newblock> Documentation/CodeStyle file in Linux source
      tree.<newblock>

      <bibitem*|GHS+09><label|bib-graylin2009cyclomatic>JAY Graylin,
      Joanne<nbsp>E Hale, Randy<nbsp>K Smith, HALE David, Nicholas<nbsp>A
      Kraft, WARD Charles et<nbsp>al.<newblock> Cyclomatic complexity and
      lines of code: empirical evidence of a stable linear
      relationship.<newblock> <with|font-shape|italic|Journal of Software
      Engineering and Applications>, 2(03):137, 2009.<newblock>

      <bibitem*|Gla02><label|bib-glass2002facts>Robert<nbsp>L
      Glass.<newblock> <with|font-shape|italic|Facts and fallacies of
      software engineering>.<newblock> Addison-Wesley Professional,
      2002.<newblock>

      <bibitem*|hit><label|bib-linux-market-share>Hitslink.com.<newblock>
      "operating system market share".<newblock>
      Http://marketshare.hitslink.com/operating-system-market-share.aspx?qprid=8.<newblock>

      <bibitem*|Ins81><label|bib-isi_793rfc81>Information<nbsp>Sciences
      Institute.<newblock> RFC 793.<newblock> 1981.<newblock> Edited by Jon
      Postel. Available at http://rfc.sunsite.dk/rfc/rfc793.html.<newblock>

      <bibitem*|Kam14><label|bib-Kamp:2014:PPO:2602649.2602816>Poul-Henning
      Kamp.<newblock> Please put openssl out of its misery.<newblock>
      <with|font-shape|italic|Queue>, 12(3):20\U20, apr 2014.<newblock>

      <bibitem*|lin><label|bib-linux-repo-cgit>Linux-repo-cgit.<newblock>
      https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/refs/.<newblock>

      <bibitem*|Lov10><label|bib-love2010linux>Robert Love.<newblock>
      <with|font-shape|italic|Linux kernel development>.<newblock>
      Addison-Wesley, Upper Saddle River, NJ, 2010.<newblock>

      <bibitem*|lwia><label|bib-lwip-doxygen><with|font-shape|italic|LWIP
      Doxygen Documentation>.<newblock>

      <bibitem*|lwib><label|bib-lwip-repo-cgit>Lwip-repo-cgit.<newblock>
      <slink|http://git.savannah.gnu.org/cgit/lwip.git/refs/>.<newblock>

      <bibitem*|lwic><label|bib-lwip-wiki-lwipopts.h>Lwip-wiki-lwipopts.h.<newblock>
      <slink|http://lwip.wikia.com/wiki/Lwipopts.h>.<newblock>

      <bibitem*|McC76><label|bib-mccabe1976complexity>Thomas<nbsp>J
      McCabe.<newblock> A complexity measure.<newblock>
      <with|font-shape|italic|IEEE Transactions on software Engineering>,
      (4):308\U320, 1976.<newblock>

      <bibitem*|Mic><label|bib-java-conventions>Sun Microsystems.<newblock>
      "code conventions for the java programming language".<newblock>
      <with|font-shape|italic|<slink|http://www.oracle.com/technetwork/java/index-135089.html>>.<newblock>

      <bibitem*|MMAS83><label|bib-maccabe1983structured>T.J.<nbsp>MacCabe,
      McCabe, Associates<localize|, and >IEEE<nbsp>Computer
      Society.<newblock> <with|font-shape|italic|Structured
      testing>.<newblock> Tutorial Texts Series. IEEE Computer Society Press,
      1983.<newblock>

      <bibitem*|MMFR96><label|bib-RFC2018>M.<nbsp>Mathis, J.<nbsp>Mahdavi,
      S.<nbsp>Floyd<localize|, and >A.<nbsp>Romanow.<newblock> Tcp selective
      acknowledgment options.<newblock> RFC 2018, RFC Editor, October
      1996.<newblock>

      <bibitem*|Pro15><label|bib-man-tcp>Linux<nbsp>Man<nbsp>Pages
      Project.<newblock> <with|font-shape|italic|Linux Programmers Manuel -
      TCP (man 7 tcp)>.<newblock> 12 2015.<newblock>

      <bibitem*|QK12><label|bib-quade2012linux>Jürgen Quade<localize| and
      >Eva-Katharina Kunst.<newblock> <with|font-shape|italic|Linux-Treiber
      entwickeln>.<newblock> Dpunkt Verlag, 2012.<newblock>

      <bibitem*|RKL88><label|bib-c-prog-lang>Dennis<nbsp>M Ritchie,
      Brian<nbsp>W Kernighan<localize|, and >Michael<nbsp>E Lesk.<newblock>
      <with|font-shape|italic|The C programming language>.<newblock> Prentice
      Hall Englewood Cliffs, 1988.<newblock>

      <bibitem*|Ros13><label|bib-rosen2013linux>R.<nbsp>Rosen.<newblock>
      <with|font-shape|italic|Linux Kernel Networking: Implementation and
      Theory>.<newblock> Books for professionals by professionals. Apress,
      2013.<newblock>

      <bibitem*|San08><label|bib-sanghai2008building>Kaushal
      Sanghai.<newblock> Building complex vdk/lwip applications using
      blackfin processors.<newblock> <with|font-shape|italic|Analog Devices
      Inc>, 2008.<newblock>

      <bibitem*|Spi08><label|bib-Spi08b>Diomidis Spinellis.<newblock> A tale
      of four kernels.<newblock> <localize|In >Wilhelm Schäfer,
      Matthew<nbsp>B.<nbsp>Dwyer<localize|, and >Volker Gruhn<localize|,
      editors>, <with|font-shape|italic|ICSE '08: Proceedings of the 30th
      International Conference on Software Engineering>, <localize|pages
      >381\U390. New York, may 2008. Association for Computing
      Machinery.<newblock>

      <bibitem*|Ste93><label|bib-Stevens:1993:TIP>W.<nbsp>Richard
      Stevens.<newblock> <with|font-shape|italic|TCP/IP Illustrated (Vol. 1):
      The Protocols>.<newblock> Addison-Wesley Longman Publishing Co., Inc.,
      Boston, MA, USA, 1993.<newblock>

      <bibitem*|SV09><label|bib-seth2009tcp>Sameer Seth<localize| and
      >M<nbsp>Ajaykumar Venkatesulu.<newblock> <with|font-shape|italic|TCP/IP
      architecture, design and implementation in Linux>,
      <localize|volume><nbsp>68.<newblock> John Wiley & Sons, 2009.<newblock>

      <bibitem*|Tan03><label|bib-tanenbaum2003computer>Andrew<nbsp>S
      Tanenbaum.<newblock> Computer networks, 4-th edition.<newblock>
      <with|font-shape|italic|Ed: Prentice Hall>, 2003.<newblock>

      <bibitem*|TM10><label|bib-thomas2010effective>Neil Thomas<localize| and
      >Gail Murphy.<newblock> How effective is modularization.<newblock>
      <with|font-shape|italic|Making Software: What Really Works, and Why We
      Believe It>, <localize|page >373, 2010.<newblock>

      <bibitem*|Vel08><label|bib-velusamy2008lightweight>Siva
      Velusamy.<newblock> Lightweight ip (lwip) application
      examples.<newblock> 2008.<newblock>

      <bibitem*|WS95><label|bib-wright1995tcp>Gary<nbsp>R Wright<localize|
      and >W<nbsp>Richard Stevens.<newblock> <with|font-shape|italic|TcP/IP
      Illustrated>, <localize|volume><nbsp>2.<newblock> Addison-Wesley
      Professional, 1995.<newblock>
    </bib-list>
  </bibliography>

  <subsection*|About the Sources Used in this Work>

  This work uses, additionally to conventional sources like books, articles
  and web sources, two rather unconventional sources which are:

  <\enumerate>
    <item>The auto-generated doxygen documentation in the LWIP repository

    <item>Source Code files\ 
  </enumerate>

  Both additional sources deserve a little annotation and comment:

  <\description-long>
    <item*|Auto-generated doxygen documentation of LWIP 2.0.0
    <cite|lwip-doxygen> >This source is neither a classical written source,
    nor a web source.\ 

    It is generated from the coments in the LWIP source code files and some
    extra text files in the LWIP directory. Since it contains a lot of
    helpful and comprehensive information, we chose to use it.\ 

    In the attachment to this work, you can find a folder called
    <verbatim|lwip-doc>. In this folder there is the sub-subfolder
    <verbatim|doxygen/output/> in which you can find the file
    <verbatim|index.html>

    If you open this file with your favorite web-browser you can browse
    through the whole lwip doxygen documentation, which is quite
    comprehensive. It contains information of alle imporntant data
    structures, almost every function and several important concepts.

    We refer to this documentation using the bibtex sigil <cite|lwip-doxygen>

    <item*|Source Code files>In several places we argue and reason using
    source code files.\ 

    Since using the bibliography to reference these source would be quite
    impractical we decided to indicate the concrete filename directly in this
    places using <verbatim|verbatim font>.

    All the source files used (and probably some more) are also part of the
    attachment of this work, in exactly the version we used.
  </description-long>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|par-columns|1>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|5>>
    <associate|auto-10|<tuple|3.2|10>>
    <associate|auto-11|<tuple|3.2.1|10>>
    <associate|auto-12|<tuple|3.2.2|10>>
    <associate|auto-13|<tuple|4|13>>
    <associate|auto-14|<tuple|4.1|13>>
    <associate|auto-15|<tuple|4.1|13>>
    <associate|auto-16|<tuple|4.2|13>>
    <associate|auto-17|<tuple|4.2.1|14>>
    <associate|auto-18|<tuple|4.1|15>>
    <associate|auto-19|<tuple|4.2|15>>
    <associate|auto-2|<tuple|1.1|5>>
    <associate|auto-20|<tuple|4.2.2|16>>
    <associate|auto-21|<tuple|4.3|16>>
    <associate|auto-22|<tuple|4.3.1|16>>
    <associate|auto-23|<tuple|4.3|20>>
    <associate|auto-24|<tuple|4.3.2|20>>
    <associate|auto-25|<tuple|4.4|20>>
    <associate|auto-26|<tuple|4.3.3|20>>
    <associate|auto-27|<tuple|5|23>>
    <associate|auto-28|<tuple|5.1|23>>
    <associate|auto-29|<tuple|5.2|23>>
    <associate|auto-3|<tuple|1.2|6>>
    <associate|auto-30|<tuple|5.2.1|23>>
    <associate|auto-31|<tuple|5.1|24>>
    <associate|auto-32|<tuple|5.2.2|25>>
    <associate|auto-33|<tuple|5.3|25>>
    <associate|auto-34|<tuple|5.3.1|25>>
    <associate|auto-35|<tuple|5.3.2|26>>
    <associate|auto-36|<tuple|5.3.3|26>>
    <associate|auto-37|<tuple|5.4|26>>
    <associate|auto-38|<tuple|5.4.1|26>>
    <associate|auto-39|<tuple|5.4.2|27>>
    <associate|auto-4|<tuple|2|7>>
    <associate|auto-40|<tuple|5.4.2.1|27>>
    <associate|auto-41|<tuple|5.2|27>>
    <associate|auto-42|<tuple|5.4.2.2|27>>
    <associate|auto-43|<tuple|5.3|27>>
    <associate|auto-44|<tuple|5.4.3|28>>
    <associate|auto-45|<tuple|5.4.3.1|28>>
    <associate|auto-46|<tuple|5.1|28>>
    <associate|auto-47|<tuple|5.4|29>>
    <associate|auto-48|<tuple|5.4.3.2|30>>
    <associate|auto-49|<tuple|5.2|30>>
    <associate|auto-5|<tuple|2.1|7>>
    <associate|auto-50|<tuple|5.5|30>>
    <associate|auto-51|<tuple|5.4.4|31>>
    <associate|auto-52|<tuple|5.4.4.1|32>>
    <associate|auto-53|<tuple|5.6|32>>
    <associate|auto-54|<tuple|5.4.4.2|33>>
    <associate|auto-55|<tuple|5.7|33>>
    <associate|auto-56|<tuple|5.4.5|33>>
    <associate|auto-57|<tuple|5.4.5.1|33>>
    <associate|auto-58|<tuple|5.8|34>>
    <associate|auto-59|<tuple|5.4.5.2|34>>
    <associate|auto-6|<tuple|2.2|7>>
    <associate|auto-60|<tuple|5.3|34>>
    <associate|auto-61|<tuple|5.5|34>>
    <associate|auto-62|<tuple|5.6|35>>
    <associate|auto-63|<tuple|6|37>>
    <associate|auto-64|<tuple|6.1|37>>
    <associate|auto-65|<tuple|6.1|37>>
    <associate|auto-66|<tuple|6.2|38>>
    <associate|auto-67|<tuple|6.3|39>>
    <associate|auto-68|<tuple|6.1|39>>
    <associate|auto-69|<tuple|7|41>>
    <associate|auto-7|<tuple|3|9>>
    <associate|auto-70|<tuple|7.1|42>>
    <associate|auto-71|<tuple|A|43>>
    <associate|auto-72|<tuple|B|45>>
    <associate|auto-73|<tuple|B.1|45>>
    <associate|auto-74|<tuple|B.2|48>>
    <associate|auto-75|<tuple|B.2|51>>
    <associate|auto-76|<tuple|WS95|51>>
    <associate|auto-8|<tuple|3.1|9>>
    <associate|auto-9|<tuple|3.1|9>>
    <associate|bib-Kamp:2014:PPO:2602649.2602816|<tuple|Kam14|51>>
    <associate|bib-RFC2018|<tuple|MMFR96|51>>
    <associate|bib-RFC7413|<tuple|CCRJ14|51>>
    <associate|bib-Spi08b|<tuple|Spi08|51>>
    <associate|bib-Stevens:1993:TIP|<tuple|Ste93|51>>
    <associate|bib-allman.paxson.stevens_2581rfc99|<tuple|APS99|51>>
    <associate|bib-baiocchi2007yeah|<tuple|BCV|51>>
    <associate|bib-brakmo1994tcp|<tuple|BOP94|51>>
    <associate|bib-c-prog-lang|<tuple|RKL88|51>>
    <associate|bib-coding-style-linux|<tuple|cod|51>>
    <associate|bib-glass2002facts|<tuple|Gla02|51>>
    <associate|bib-graylin2009cyclomatic|<tuple|GHS+09|51>>
    <associate|bib-isi_793rfc81|<tuple|Ins81|51>>
    <associate|bib-java-conventions|<tuple|Mic|51>>
    <associate|bib-linux-market-share|<tuple|hit|51>>
    <associate|bib-linux-repo-cgit|<tuple|lin|51>>
    <associate|bib-love2010linux|<tuple|Lov10|51>>
    <associate|bib-lwip-doxygen|<tuple|lwia|51>>
    <associate|bib-lwip-repo-cgit|<tuple|lwib|51>>
    <associate|bib-lwip-wiki-lwipopts.h|<tuple|lwic|51>>
    <associate|bib-maccabe1983structured|<tuple|MMAS83|51>>
    <associate|bib-man-tcp|<tuple|Pro15|51>>
    <associate|bib-mccabe1976complexity|<tuple|McC76|51>>
    <associate|bib-quade2012linux|<tuple|QK12|51>>
    <associate|bib-rosen2013linux|<tuple|Ros13|51>>
    <associate|bib-sanghai2008building|<tuple|San08|51>>
    <associate|bib-seth2009tcp|<tuple|SV09|51>>
    <associate|bib-tanenbaum2003computer|<tuple|Tan03|51>>
    <associate|bib-thomas2010effective|<tuple|TM10|51>>
    <associate|bib-velusamy2008lightweight|<tuple|Vel08|51>>
    <associate|bib-wright1995tcp|<tuple|WS95|51>>
    <associate|data-structure-statistics|<tuple|6.1|39>>
    <associate|footnote-1.1|<tuple|1.1|5>>
    <associate|footnote-1.2|<tuple|1.2|6>>
    <associate|footnote-2.1|<tuple|2.1|7>>
    <associate|footnote-2.2|<tuple|2.2|7>>
    <associate|footnote-2.3|<tuple|2.3|7>>
    <associate|footnote-2.4|<tuple|2.4|7>>
    <associate|footnote-3.1|<tuple|3.1|9>>
    <associate|footnote-3.2|<tuple|3.2|10>>
    <associate|footnote-3.3|<tuple|3.3|11>>
    <associate|footnote-4.1|<tuple|4.1|13>>
    <associate|footnote-4.2|<tuple|4.2|13>>
    <associate|footnote-4.3|<tuple|4.3|13>>
    <associate|footnote-4.4|<tuple|4.4|15>>
    <associate|footnote-4.5|<tuple|4.5|15>>
    <associate|footnote-4.6|<tuple|4.6|18>>
    <associate|footnote-4.7|<tuple|4.7|18>>
    <associate|footnote-5.1|<tuple|5.1|23>>
    <associate|footnote-5.10|<tuple|5.10|34>>
    <associate|footnote-5.11|<tuple|5.11|34>>
    <associate|footnote-5.12|<tuple|5.12|34>>
    <associate|footnote-5.2|<tuple|5.2|24>>
    <associate|footnote-5.3|<tuple|5.3|24>>
    <associate|footnote-5.4|<tuple|5.4|25>>
    <associate|footnote-5.5|<tuple|5.5|27>>
    <associate|footnote-5.6|<tuple|5.6|27>>
    <associate|footnote-5.7|<tuple|5.7|28>>
    <associate|footnote-5.8|<tuple|5.8|30>>
    <associate|footnote-5.9|<tuple|5.9|31>>
    <associate|footnote-6.1|<tuple|6.1|39>>
    <associate|footnr-1.1|<tuple|1.1|5>>
    <associate|footnr-1.2|<tuple|1.2|6>>
    <associate|footnr-2.1|<tuple|2.1|7>>
    <associate|footnr-2.2|<tuple|2.2|7>>
    <associate|footnr-2.3|<tuple|2.3|7>>
    <associate|footnr-2.4|<tuple|2.4|7>>
    <associate|footnr-3.1|<tuple|3.1|9>>
    <associate|footnr-3.2|<tuple|3.2|10>>
    <associate|footnr-3.3|<tuple|3.3|11>>
    <associate|footnr-4.1|<tuple|4.1|13>>
    <associate|footnr-4.2|<tuple|4.2|13>>
    <associate|footnr-4.3|<tuple|4.3|13>>
    <associate|footnr-4.4|<tuple|4.4|15>>
    <associate|footnr-4.5|<tuple|4.5|15>>
    <associate|footnr-4.6|<tuple|4.6|18>>
    <associate|footnr-4.7|<tuple|4.7|18>>
    <associate|footnr-5.1|<tuple|5.1|23>>
    <associate|footnr-5.10|<tuple|5.10|34>>
    <associate|footnr-5.11|<tuple|5.11|34>>
    <associate|footnr-5.12|<tuple|5.12|34>>
    <associate|footnr-5.2|<tuple|5.2|24>>
    <associate|footnr-5.3|<tuple|5.3|24>>
    <associate|footnr-5.4|<tuple|5.4|25>>
    <associate|footnr-5.5|<tuple|5.5|27>>
    <associate|footnr-5.6|<tuple|5.6|27>>
    <associate|footnr-5.7|<tuple|5.7|28>>
    <associate|footnr-5.8|<tuple|5.8|30>>
    <associate|footnr-5.9|<tuple|5.9|31>>
    <associate|footnr-6.1|<tuple|6.1|39>>
    <associate|kconfig-def|<tuple|4.1|17>>
    <associate|linux-cc|<tuple|5.7|33>>
    <associate|linux-dir|<tuple|4.3.1|16>>
    <associate|linux-file-lenghts|<tuple|5.3|27>>
    <associate|linux-histogram|<tuple|5.5|30>>
    <associate|lwip-cc|<tuple|5.6|32>>
    <associate|lwip-dir|<tuple|4.2.1|14>>
    <associate|lwip-histogram|<tuple|5.4|29>>
    <associate|lwip-pbuf-def|<tuple|6.1|37>>
    <associate|skb-appendix|<tuple|B|45>>
    <associate|static-analysis-tools|<tuple|5.1|24>>
    <associate|tcp-features|<tuple|3.1|9>>
    <associate|tcp-sack-appendix|<tuple|A|43>>
    <associate|tcp_setprio|<tuple|5.8|34>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      tanenbaum2003computer

      Spi08b

      wright1995tcp

      wright1995tcp

      Stevens:1993:TIP

      isi_793rfc81

      man-tcp

      lwip-doxygen

      linux-market-share

      linux-market-share

      sanghai2008building

      velusamy2008lightweight

      linux-repo-cgit

      love2010linux

      lwip-repo-cgit

      lwip-doxygen

      lwip-wiki-lwipopts.h

      c-prog-lang

      baiocchi2007yeah

      brakmo1994tcp

      allman.paxson.stevens_2581rfc99

      Stevens:1993:TIP

      RFC7413

      love2010linux

      quade2012linux

      rosen2013linux

      seth2009tcp

      isi_793rfc81

      Kamp:2014:PPO:2602649.2602816

      java-conventions

      glass2002facts

      Spi08b

      Spi08b

      thomas2010effective

      Spi08b

      RFC2018

      man-tcp

      coding-style-linux

      rosen2013linux

      Spi08b

      coding-style-linux

      mccabe1976complexity

      Spi08b

      maccabe1983structured

      Spi08b

      graylin2009cyclomatic

      lwip-doxygen

      lwip-doxygen

      lwip-doxygen

      rosen2013linux

      love2010linux

      lwip-doxygen

      lwip-doxygen
    </associate>
    <\associate|figure>
      <tuple|normal|Conditional Compilation Example|<pageref|auto-18>>

      <tuple|normal|Ag Command Used to Search for Uses of This Special
      Conditional Compilation Structure|<pageref|auto-19>>

      <tuple|normal|Final Analysis set of Linux TCP
      Implementation|<pageref|auto-23>>

      <tuple|normal|Linux TCP Header Files|<pageref|auto-25>>

      <tuple|normal|The three Categories of Static Analysis
      Tools|<pageref|auto-31>>

      <tuple|normal|File Lengths in the LWIP TCP
      Implementation|<pageref|auto-41>>

      <tuple|normal|File Lengths in the Linux TCP
      Implementation|<pageref|auto-43>>

      <tuple|normal|LWIP: Histogram of Function Lengths|<pageref|auto-47>>

      <tuple|normal|Linux TCP: Histogram of Function
      Lengths|<pageref|auto-50>>

      <tuple|normal|Histogram of the Cyclomatic Complexity distribution of
      the LWIP TCP Functions|<pageref|auto-53>>

      <tuple|normal|Histogram of the Cyclomatic Complexity Distribution of
      the Linux TCP Functions|<pageref|auto-55>>

      <tuple|normal|tcp_setprio() in LWIP tcp.c|<pageref|auto-58>>

      <tuple|normal|The Definition of the LWIP PBUF structure in
      <with|font-family|<quote|tt>|language|<quote|verbatim>|include/lwip/pbuf.h>|<pageref|auto-65>>
    </associate>
    <\associate|table>
      <tuple|normal|Feature Comparison of the Two TCP
      Implementations|<pageref|auto-9>>

      <tuple|normal|Software Versions Used for Analysis|<pageref|auto-15>>

      <tuple|normal|General Statistics About The Functions in LWIP TCP
      Code|<pageref|auto-46>>

      <tuple|normal|General Statistics About The Functions in LWIP TCP
      Code|<pageref|auto-49>>

      <tuple|normal|Overall Comment Density Statistics|<pageref|auto-60>>

      <tuple|normal|Quantitative Data on the Packet Data
      Structures|<pageref|auto-68>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Target Audience <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2<space|2spc>Required Knowledge <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Related
      Work> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      2.1<space|2spc>A Tale of Four Kernels
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      2.2<space|2spc>TCP/IP Illustrated Volume 2
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Feature
      Comparison and User Base> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      3.1<space|2spc>Feature Comparison <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      3.2<space|2spc>User Base <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|3.2.1<space|2spc>Linux TCP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|3.2.2<space|2spc>LWIP TCP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>TCP
      Code Overview and Isolation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      4.1<space|2spc>Which Versions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      4.2<space|2spc>LWIP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      <with|par-left|<quote|1tab>|4.2.1<space|2spc>C Source Files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|4.2.2<space|2spc>Header Files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      4.3<space|2spc>Linux TCP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      <with|par-left|<quote|1tab>|4.3.1<space|2spc>C Source Files (Using
      Directory Structure and File Names)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|4.3.2<space|2spc>Header files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|4.3.3<space|2spc>Evaluation of Results and
      Methodology <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Code
      Quality Metrics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.5fn>

      5.1<space|2spc>Why Code Quality? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      5.2<space|2spc>Static Code Analysis Tools Evaluation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      <with|par-left|<quote|1tab>|5.2.1<space|2spc>Static Code Analysis Tools
      in General <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|1tab>|5.2.2<space|2spc>Code Quality Metrics Tools
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      5.3<space|2spc>How we Obtained The Results
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>

      <with|par-left|<quote|1tab>|5.3.1<space|2spc>Command Usage
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1tab>|5.3.2<space|2spc>About the Output Format
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|1tab>|5.3.3<space|2spc>Getting per Function
      Metrics <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      5.4<space|2spc>Results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>

      <with|par-left|<quote|1tab>|5.4.1<space|2spc>Directory Structure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|1tab>|5.4.2<space|2spc>File Lengths
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|2tab>|5.4.2.1<space|2spc>LWIP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <with|par-left|<quote|2tab>|5.4.2.2<space|2spc>Linux TCP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1tab>|5.4.3<space|2spc>Function Lengths
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      <with|par-left|<quote|2tab>|5.4.3.1<space|2spc>LWIP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>>

      <with|par-left|<quote|2tab>|5.4.3.2<space|2spc>Linux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>>

      <with|par-left|<quote|1tab>|5.4.4<space|2spc>Cyclomatic Complexity (CC)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      <with|par-left|<quote|2tab>|5.4.4.1<space|2spc>LWIP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>>

      <with|par-left|<quote|2tab>|5.4.4.2<space|2spc>Linux TCP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>>

      <with|par-left|<quote|1tab>|5.4.5<space|2spc>Comment Density
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|2tab>|5.4.5.1<space|2spc>In Function Comments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|2tab>|5.4.5.2<space|2spc>In Function Comments and
      Function Descriptions (All Comments)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>>

      5.5<space|2spc>A Short Qualitative Evaluation of the Header Files
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>

      5.6<space|2spc>Lines of Code and Cyclomatic Complexity - A Correlation?
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>A
      short Discussion of Data Structures>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63><vspace|0.5fn>

      6.1<space|2spc>The LWIP Packet Data Structure (PBUF)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-64>

      6.2<space|2spc>The Linux Packet Data Structure (SKB)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>

      6.3<space|2spc>Comparative Thoughts
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-67>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69><vspace|0.5fn>

      7.1<space|2spc>Ending Thoughts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      A<space|2spc>TCP SACK Functions in tcp_input.c>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-71><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix
      B<space|2spc>The Linux Socket Buffer Data Structure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-72><vspace|0.5fn>

      B.1<space|2spc>C Definition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>

      B.2<space|2spc>Struct Member Documentation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-74>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-75><vspace|0.5fn>

      <with|par-left|<quote|1tab>|About the Sources Used in this Work
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-76>>
    </associate>
  </collection>
</auxiliary>