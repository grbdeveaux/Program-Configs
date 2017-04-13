# .vim

Using the vundle plugin manager.

When using ultisnips to begin and end an environment in latex, only type in
begin and then select the snippet, DON'T type in the backslash.

Ultisnip expand trigger either expands the currently selected snippet or the
first one listed. Trigger also works with no listing. If the word is already
typed in, simply move the cursor over it and press the trigger keys and what
would be the first snipped will be expanded.

e.g. for LaTeX, typing the beginning of the environment will bring up a snippet for
that environment, create and item, and bring the cursor in front of that item.
For example, typing enum and expanding the snippet with the trigger will create
th following:

\begin{enumerate}
    \item
\end{enumerate}

Using Solarized and Inconsolata (for Powerline) as per what seems to be the industry standard.
