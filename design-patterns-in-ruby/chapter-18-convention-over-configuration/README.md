# Chapter 18: Convention over configuration

## <protocol>Adapter with const_get

Instead of:

```
def adapter_for(message)
  protocol = message.to.scheme
  return FileAdapter.new if protocol == 'file'
  return HttpAdapter.new if protocol == 'http'
  return SmtpAdapter.new if protocol == 'smtp'
  nil
end
```

do:

```
def adapter_for(message)
  protocol = message.to.scheme.downcase
  adapter_name = "#{protocol.capitalize}Adapter"
  adapter_class = self.class.const_get(adapter_name)
  adapter_class.new
end
```

## loading the classes

Instead of: 

```
require 'file_adapter'
require 'http_adapter'
require 'smtp_adapter'
```

do:

```
def load_adapters
 lib_dir = File.dirname(__FILE__)
 full_pattern = File.join(lib_dir, 'adapter', '*.rb')
 Dir.glob(full_pattern).each {|file| require file }
end
```
