# odML - The open metadata markup language - 

This repository collects and maintains odML terminologies. 
odML Terminologies define terms that can be used for annotating Neuroscientific data 
in general and electrophysiological data in particular.

More information on odml can be found at the [main odML page](http://www.g-node.org/odml).

Tools and libraries for metadata handling with odml can be found on Github at 
[https://github.com/G-Node](https://github.com/G-Node)


## A brief introduction to odML and metadata

odML (open metadata Markup Language) is a framework, proposed by 
[Grewe et al. (2011)](http://journal.frontiersin.org/article/10.3389/fninf.2011.00016/full),
to organize and store experimental metadata in a human- and machine-readable,
XML based format (odml). In this tutorial we will illustrate the conceptual
design of the odML framework and show hands-on how you can generate your own
odML metadata file collection. A well organized metadata management of your
experiment is a key component to guarantee the reproducibility of your research
and facilitate the provenance tracking of your analysis projects.

### What are metadata and why are they needed?
Metadata are data about data. They describe the conditions under which the
actual raw-data of an experimental study were acquired. The organization of
such metadata and their accessibility may sound like a trivial task, and
most laboratories developed their home-made solutions to keep track of
their metadata. Most of these solutions, however, break down if data and
metadata need to be shared within a collaboration, because implicit
knowledge of what is important and how it is organized is often
underestimated.

While maintaining the relation to the actual raw-data, odML can help to
collect all metadata which are usually distributed over several files and
formats, and to store them unitedly which facilitates sharing data and
metadata.

### Key features of odML
- open, XML based language, to collect, store and share metadata
- Machine- and human-readable
- Python-odML library
- Interactive odML-Editor
