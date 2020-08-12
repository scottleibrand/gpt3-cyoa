# gpt3-cyoa
Building a choose-your-own-adventure story generator using the GTP-3 API

## GPT-3 context window limitation
One of the key limitations of GPT-3 is its [small context window](https://www.gwern.net/GPT-3#small-context-window): 2048 BPE tokens, or roughly 500-1000 words. “This means it cannot hope to write anything of any serious length, because the beginning will soon vanish over the event horizon, and it also limits its ability to engage in few-shot learning, for the same reason: the prompt+generation will quickly exceed the window length.”

## Hierarchical outlining via summarization and re-expansion
This document proposes to work around this limitation by use of hierarchical outlining by summarization and re-expansion. For example, GPT-3 should be able to summarize ~500 words (a few paragraphs) of raw text into subsection summaries, multiple subsection summaries into section summaries (if necessary), multiple (sub)section summaries into chapter summaries, and multiple chapter summaries into whole-work plot summaries or abstracts. Each level of summarization should be optimized (via careful prompting) to output all of the information critical to allowing GPT-3 (or a skilled human author) to generate a new re-expansion of the summarized (sub)section that fits, as well as possible, within the larger work.

By producing and storing such summaries will serve as a form of hierarchical external memory for GPT-3, allowing it to work on a given subset of a document without forgetting the larger context. This, in turn, will allow many runs of GPT-3 to be combined (via the use of previous outputs as part of the prompts for subsequent runs) into a more coherent whole

## Applications
### Summarization of existing works
The most straightforward application of such a hierarchical summarization architecture is to produce summaries and expansions of existing work targeted to particular audiences. As [demonstrated here](https://andrewmayneblog.wordpress.com/2020/06/13/openai-api-alchemy-summarization/), that has tremendous potential in education: “With OpenAI’s API, anyone can take their content and make it accessible to a wider audience. You could use the API to take difficult concepts and make it easier for people to work their way up from a simple to a more complex understanding of a topic. You can also create this content at the same time by asking the API to provide varying degrees of sophistication in the explanation.”

If successful, such multi-level summaries could allow readers to much more quickly internalize a work, at whatever level of detail they desire. It could make jargon-heavy research papers more accessible to those in other fields, and allow experts to more quickly internalize a summary of a long paper while still letting them drill down into novel sections of particular interest.

### Expansion of short-form works
It would also allow authors (or readers) to expand a short work into a longer (or alternate) form, which may be desirable for works of fiction, self-help, or other content where detailed factual accuracy is less of a concern.

### Create-your-own-adventure fiction
Another very interesting application is “create-your-own-adventure” fiction.

Starting with a classic or well-known work (or genre), GPT-3 could generate multi-level hierarchical summary outlines of the contents and plot, and then at each summarization point generate several possible summaries of what could happen next. By expanding each such next-step summary, it could allow the reader to begin exploring alternative permutations of the story. At each step, the reader could be cued to upvote or downvote a particular (sub)section. If they upvote, GPT-3 could keep generating plausible next-step subsection/section/chapter summaries and expanding those into additional content to allow the reader to continue exploring that thread. If the reader downvotes a given subsection, they could be given the opportunity to either read an alternative text expansion of the same subsection summary or to select an alternative next-step summary if they wish to guide the story in a different direction. At any point, the user would also be able to select from alternative next-step summaries, either from their current point in the story or a previous point.

As each reader continues reading, GPT-3 would be kept on track by prompts that include the summaries of prior chapters, sections within the current chapter, subsections within the current section, and a selection of previously upvoted expansions. The full tree of generated next-step summaries and resulting expansions would be stored, and each possible next-step action a reader might take would be pre-generated using the GPT-3 API to ensure that the reader doesn’t have to wait to continue reading while the new text is generated.

Once previous readers have selected (via upvoting) a number of interesting story threads, those particular threads could be presented to new readers as the default path(s) forward. This has the dual benefits of increasing the average story quality presented to (particularly new) readers and reducing the number of GPT-3 API calls required for each reader.

## Experiments
The first step in figuring out how to do this is determining what prompts are required to get GPT-3 to generate summaries that capture enough detail about a text to allow GPT-3 to subsequently reexpand them into new text consistent enough with the original that it could fit within the same document without too much disruption. The summarization prompt would likely need to give at least one example of input text and a good summary of it, as well as some recent and previous summaries to provide context, and the new input text to be summarized. This all needs to fit inside the context window, so some trial and error will be required to figure out what works best. The expansion prompt would likely require similar examples and recent/previous summaries.

Another form of completion we’ll need to figure out how to prompt GPT-3 to perform is generating reasonable next-step summaries at each level of abstraction, given where it is in the existing outline of plot, chapter, section, and subsection summaries.


## Other relevant links:
https://andrewmayneblog.wordpress.com/2020/06/15/will-artificial-intelligence-ever-write-a-novel/
https://twitter.com/gwern/status/1285017616592130052
https://www.reddit.com/r/slatestarcodex/comments/hthoxy/how_does_gpt3_tie_into_the_old_hanson_vs/fyhki3q/

### Simplify.so

Simplify.so uses GPT-3 to paraphrase input text at a simpler reading level. For example, here is how it summarized the first part of the document above:

GPT-3 is a computer program that generates a summary of a book. It is very good at generating summaries of books. But it can only generate summaries of a few hundred words. So it can't write books that are longer than that. The fifth grader got it right away. It is important to note that the concept of summarization has been around for a long time, and is used in many different contexts. For example, when you read a newspaper, you are essentially reading a summary of the news. And if you have ever read an abstract or summary of a scientific paper, you are reading a summary of the scientific paper. The key difference here is that this computer program is much better at summarizing than humans are. It is much faster, more accurate, and can generate more complex summaries than humans can. The question then becomes: What can we use this program for? We have already seen one application: generating summaries of books. This could be used to make books more accessible to people who do not have time to read them all the way through. It could also be used to make books more accessible to people who do not have the…

And:

Imagine a novel.  Imagine you are reading a novel.  Now imagine you are reading the same novel, but this time, instead of reading it in the normal way, you are presented with a list of different options to choose from.  Each option is a new chapter, and each chapter is different from the others.  For example, one chapter might be about a character who goes on an adventure to find something, and another chapter might be about a character who goes on an adventure to find someone.  In this way, you can explore the story in different ways and read about what happens in different places. "What if I don't like one of the options?" he asked.  "What if I want to go back to where I was before?"  "That's easy," I said. "Just choose another option." "But how do I know which option is best?" he asked. "That's easy too," I said. "You just choose whichever option you like best."

On one of my tries, it also had another idea:

For example, if you were reading a book about Ancient Rome, and you got to a section about the Roman army, you could click on the button to ask for an explanation of what the Roman army was. The program would then explain it in detail. If you wanted to know more about how the army was organized, you could click on that button, and it would explain that in detail. If you wanted to know more about how the army fought battles, you could click on that button, and it would explain that in detail. You could do this with any topic in the book. You could also click on a section and ask for an explanation of something that was not explained earlier in the book.
