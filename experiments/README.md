# Experiments

The first step is determining what prompts are required to get GPT-3 to generate summaries that capture enough detail about a text to allow GPT-3 to subsequently reexpand them into new text consistent enough with the original that it could fit within the same document without too much disruption. The summarization prompt would likely need to give at least one example of input text and a good summary of it, as well as some recent and previous summaries to provide context, and the new input text to be summarized. This all needs to fit inside the context window, so some trial and error will be required to figure out what works best. The expansion prompt would likely require similar examples and recent/previous summaries.

Another form of completion we’ll need to figure out how to prompt GPT-3 to perform is generating reasonable next-step summaries at each level of abstraction, given where it is in the existing outline of plot, chapter, section, and subsection summaries.

## Record all results

When experimenting with GPT-3, it's temping to just try things and ignore/discard outputs that don't look correct or useful. However, this discards data that will be useful in identifying the most effective prompts, and quantifying just how reliable they are at producing useful output. It also prevents those without GPT-3 API access from learning as much from your experiments.

To avoid these issues, please place a file in this experiments directory with each prompt you try, any relevant settings you tweak, and all of the GPT-3 outputs you obatin for that prompt. 

## Automation

To facilitate this, I've created a `runprompts.sh` script that calls @minimaxir's openai_api.py to run a given prompt at zero (deterministic) temperature and then 10 times each at three higher temperatures, and saves the output files to the experiment subdirectory.
