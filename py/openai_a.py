import os
import openai

openai.api_key = os.getenv(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)

response = openai.Completion.create(
  model="text-davinci-003",
  prompt="def foo(n, k):\naccum = 0\nfor i in range(n):\n    for l in range(k):\n        accum += i\nreturn accum\n\"\"\"\nThe time complexity of this function is",
  temperature=0,
  max_tokens=64,
  top_p=1.0,
  frequency_penalty=0.0,
  presence_penalty=0.0,
  stop=["\n"]
)
