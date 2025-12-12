@props(['messages'])

@if ($messages)
    <div {{ $attributes->merge(['class' => 'invalid-feedback']) }}>
        @foreach ((array) $messages as $message)
            <i class="bx bx-error"></i> {{ $message }}
        @endforeach
    </div>
@endif
