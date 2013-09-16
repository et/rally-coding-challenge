# Rally Coding Challenge Exercise 5

## Instructions

Write some code that can be used in a templating engine.

This should take a map of variables ("day" => "Thursday", "name" => "Billy") as well as a string template ("${name} has an appointment on ${Thursday}") and perform substitution as needed.

This needs to be somewhat robust, throwing some kind of error if a template uses a variable that has not been assigned, as well as provide a way to escape the strings ("hello ${${name}}" -> "hello ${Billy}")

## Requirements

    ruby -v
    ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]

## Usage

To run tests:

    bundle install
    rspec spec
