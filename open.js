import OpenAI from "openai";

const client = new OpenAI({
  apiKey:
    "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",
  baseURL: "https://integrate.api.nvidia.com/v1",
});
const response = await client.chat.completions.create({
  model: "nvidia/nemotron-3-ultra-550b-a55b",
  messages: [
    {
      role: "user",
      content: "give me a code for php admin dashbaord",
    },
  ],
});

console.log(response.choices[0].message.content);
