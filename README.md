# Practice TDD with Bank Account

To practice the TDD process, I am working through the 3 User Stories below. I will commit my code after each red-green-refactor stage!

1. I would like to be able to see my balance
2. I would like to be able to deposit money in my account
3. I would like to be able to withdraw money from my account

The very first step of starting a Ruby project is to initialize it with a **Gemfile** which will act as a reference for all the libraries (‘gems’) I am going to use in this project. I will use Bundler, a dependency manager, to work with the gems listed in the Gemfile. Finally, I'll use Ruby Version Manager (RVM) to install and manage different versions of Ruby.

- I setup a github repo called **bank_account** on github and cloned it to my machine.  
- I then ran  `gem list`  to see the list of gems installed on my machine and could see  `bundler`  in the list of installed gems.    
-   As bundler is installed, I used it to create a Gemfile (with a capital G, it's important)  by running  `bundle init`.
- I added this code, specifying my Ruby version and Rspec gem, after the  `git_source`  line:
```ruby
ruby '2.7.0'
group :development, :test do
  gem "rspec"
end
```
- The next step of the process is to run `bundle install`. This will invoke bundler, that will look into `Gemfile`, see if any of the gems need to be installed (they may already be installed), install them and save the information about the gems, their versions and dependencies into an automatically generated `Gemfile.lock`.
- I then made my first commit and pushed to github.
- I then typed `rspec --init` in the command line to generate RSpec conventional (default) files and create an empty test suite for the BankAccount class. This created a `spec/` folder with `spec_helper.rb` inside it, and a `.rspec` file in my project directory.
- Using naming convention, I created my production file and spec file from the command line and made my next commit.

```
touch spec/bankaccount_spec.rb
touch lib/bankaccount.rb
```

- After the first Red-Green-Refactor, my feature test shows balance:
```ruby
:001 > require './lib/bankaccount.rb'
=> true
:002 > savings = BankAccount.new
:003 > savings
=> #<BankAccount:0x00007fb65f93fdd8 @balance=0>
:004 > savings.balance
=> 0
```
- Demonstrating the second user story, deposit:
```ruby
:002 > savings = BankAccount.new
:003 > savings.balance
=> 0
:004 > savings.deposit(5)
=> 5
:005 > savings
=> #<BankAccount:0x00007fca550b9bc8 @balance=5>
```
- The third user story, withdraw:
```ruby
:002 > savings = BankAccount.new
:003 > savings.deposit(150)
=> 150
:004 > savings.withdraw(75)
=> 75
:005 > savings
=> #<BankAccount:0x00007fd8901a6060 @balance=75>
```
- Added an edge case to prevent the balance going below 0
```ruby
:002 > savings = BankAccount.new
:003 > savings.withdraw(75)
Traceback (most recent call last):
       5: from /Users/melissapereira/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
       4: from /Users/melissapereira/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
       3: from /Users/melissapereira/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
       2: from (irb):3
       1: from /Users/melissapereira/Projects/bank_account/lib/bankaccount.rb:14:in `withdraw'
RuntimeError (Error! Balance £0)
```
