# Chapter 10: Getting in front of your object with a Proxy

## lazy initialization

```
class VirtualAccountProxy
  # ...

  def deposit(amount)
    s = subject
    return s.deposit(amount)
  end

  def subject
    @subject || (@subject = BankAccount.new(@starting_balance))
  end
end
```

Or to pass a block:

```
class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  # ...

  def subject
    @subject || (@subject = @creation_block.call)
  end
end


account = VirtualAccountProxy.new { BankAccount.new(10) }
```

## method_missing

```
class AccountProxy
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    @subject.send(name, *args)
  end
end
```

### to_s

While using `method_missing` remember that proxy class inherits from `Object` and it will run `to_s` method from `Object` class, not the class behind the proxy.
