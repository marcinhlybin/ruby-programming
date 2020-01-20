# Chapter 15: Use modules as name spaces

Add **self.** to create a module-level method that any code can use.

```
module WordProcessor
  def self.points_to_inches(points)
    points / 72.0
  end
end
```

