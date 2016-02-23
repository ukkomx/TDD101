#TDD101

## Class 01: Introduction to TDD

### What is TDD?
TDD stands for **Test-Driven Development**. It's a technique for building software that **guides** software development by writing tests.  It was created by **Kent Beck** as part of Extreme Programming. 

It is a rapid cycle of testing, coding, and refactoring, also known as "Red/Green/Refactor". The developer first writes an automated test case
which defines a desired function (Failing/Red Test), then produces the
minimum code to pass the test (), and finally refactors
the code to an acceptable standard


In TDD, the tests are written from the perspective of a class's public interface. They focus on the class' behavior, not its implementation.

### RSpec Basics

RSpec is a tool for writing **human readable** specifications (tests).

**Getting Started**

Run `gem install rspec`.

`rspec --init` will init rspec in your current directory

**

**Describing the class 'Example'**

```ruby
	
	require 'spec_helper'
	require 'example'

	describe Example do
		describe "#my_instance_method" do
			it "returns a string" do
				expect(example.my_instance_method).to eql "I am an instance method"
			end
		end
	end

```

### Up next: String Calculator Kata



Sources:

- http://www.jamesshore.com/Agile-Book/test_driven_development.html
- http://martinfowler.com/bliki/TestDrivenDevelopment.html
- http://betterspecs.org/
- http://www.extremeprogramming.org/rules/testfirst.html




