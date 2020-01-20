# Chapter 25: Create self-modifying classes

```
ENCRYPTION_ENABLED = true

class Document
  # Most of the class left behind...

  def self.enable_encryption( enabled )
    if enabled
      def encrypt_string( string )
        string.tr( 'a-zA-Z', 'm-za-lM-ZA-L')
      end
    else
      def encrypt_string( string )
        string
      end
    end
  end

  enable_encryption( ENCRYPTION_ENABLED )
end
```

You can toggle encryption off and on by calling the class method from outside.

```
Document.enable_encryption(false)
```
