# site-SOFT

# This is a site that allows users to share their feelings and memories!  

This is a site made for the SOFT (Software Engeneering) subject from Universidade do Estado de Santa Catarina (UDESC). The objective of the work the team should select a problem to be solved by a software, and specify the development of such software. The following items are documented in the form of a text document for the delivery:

- Description of the problem, containing the scope of the software and list of stakeholders.

- Software requirements: which may be in the form of descriptive functional and non-functional requirements, or user stories or system prototypes.

- Full project duration estimation (Using Cocomo or other method - must show and describe steps)

- UML Project Class Diagram: containing the main project classes, their attributes and methods. The structure of classes should utilize learned design patterns whenever necessary. The use of patterns is understood as necessary when the problem related to the pattern applies to the modeled case.

- Unit Tests: From the Project's Class Diagram, generate a "skeleton" of the project's source code. Next, write unit tests for the project's classes. If 100% test coverage of the classes is not possible, focus on the most critical methods of the project, justifying their criticality in the text. Create a repository in the cloud to place the produced classes and share the link with access to it in the text document. This repository should contain:
all source codes of project classes
all unit tests produced

Ps: 

There is beeing used the **Ruby** language with the unit testing framework **test-unit** together with **Javascript** and its framework **JestJS**

On the day of delivery, a defense will be scheduled for each job in which the team will demonstrate the tests developed

The team consists of 2 students: **Guilherme Diel** & **César Eduardo de Souza**. 

## Requirements
 
- Ruby 3.1.2

## Setup

```console
git clone https://github.com/guilhermedd/site-SOFT.git
```

```console
cd site-SOFT.git
```

```console
./bin/setup
```

```console
./bin/bundle
```

```console
./bin/rails server
```

## Usage

The website will be locally host on port http://127.0.0.1:3000
In there, you`ll need to create an account and follow the steps on the screen to start posting about your feelings

![Main menu](https://github.com/guilhermedd/site-SOFT/app/assets/images/SITE_SOFT.png)

